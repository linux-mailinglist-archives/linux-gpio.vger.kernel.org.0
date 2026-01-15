Return-Path: <linux-gpio+bounces-30616-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F7DD2831F
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 20:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2472730D9AAB
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 19:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EEB31A551;
	Thu, 15 Jan 2026 19:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oasis-open-org.20230601.gappssmtp.com header.i=@oasis-open-org.20230601.gappssmtp.com header.b="NlTPXqfO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144A1312807
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 19:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768506071; cv=none; b=Ij4pwa9G86Cmms88BBqgiCtYGCj9k1AkAoirp6joEuf9nT3fRs8UtgKrY8Gaf07dA8Y/6IhWvEtJ34TBcFo7a0iwK2u9cPs+wt7S6Ms2ptv+FfN5Xn+eoKKentDL8UMBtWnZTr/CeVSkNSObhjTzh80yyCLDNtXqlAzU1ZSFayk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768506071; c=relaxed/simple;
	bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Ih++gczAkVMxQpMu4HARBe9h7sg7j405Gk1Mhq2a3WuPnW0dhmzVuFcc1tzTZ/aQ83dJLahMHNSOVIK4RKjceLc96DXFoaEh1XwcrG+hTJA8+IRU3UIGPbh2MeK3roJKB3r8pZ9XmgmSUfRT4qDKV7Q303iraQQ65im418Javrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oasis-open.org; spf=pass smtp.mailfrom=oasis-open.org; dkim=pass (2048-bit key) header.d=oasis-open-org.20230601.gappssmtp.com header.i=@oasis-open-org.20230601.gappssmtp.com header.b=NlTPXqfO; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oasis-open.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oasis-open.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5013d163e2fso14274591cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 11:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oasis-open-org.20230601.gappssmtp.com; s=20230601; t=1768506069; x=1769110869; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
        b=NlTPXqfOOEXrw3eFPBv7GV6FlBpsv1sp/36UZaC6pkrN37bautyiRV0UtiMNXeslOy
         D58awyREsqLfI73cFtGbHf0pK0qEhf8ZWLDBhH5aFuOQJrdpQjx/ZBm492ZQcRki0ED5
         CP8SAeNIKvzH0YdQj6lxPXQGPf2zY+YoDTQN2lM03r8D5LB9V5qIG1lQUy+zAzuaoonJ
         8ZeFLpH2eyBC9fy/d9qkKvOANgRqglqUi7N//LKY0RqP3lYg+gwTs017BAa0UisAd+my
         Pm+tixYVbjkUkOLmjW+RZH88HcmkC5mpkdPmocXCCVTfOjvaLKStWH6YXe1uASEKbKnC
         JqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768506069; x=1769110869;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
        b=QiewckwN64qMCBhEfLH/29rWwzHmV+BN49TprfjPMZ8b2176jT9uZl4kHarWqTy/V3
         rfGyu7Jf6lY+mY1gcIDBxbPbAlIBAVUtnO/NEXN7UV5yFUlYWV8IoRpps3mukXDK3JdQ
         BJ1vFNHiS+CAj9aKVqf4TWqGa0IAfkadWXpNCqN6Ec7b5fdJhn7VUA9MEQDR51pcOWHT
         h6PHL9FtZobr6wLE+GcH/6adJMV5v/da85vmdeB5fo8/4Dw61LpQQB3nbig37COu2ejc
         Hr59umYPWbIiCNUwDAw8cdwIo+P4CsHUWeHjHyT3hbcyVSPeYS4kg+Y5BAYgbE4wBZOn
         hIZQ==
X-Gm-Message-State: AOJu0YxYBufEIS0G2RP6oCbR9mJeIJOq5cUhLalotjE9a1sjdsJhh3Fp
	IZdArrmVbBGbRWx0i0yrGsK9cO+DZJruQAyg1POE2MZjQPaZoTOee6Rwbu7o1pjYrYWUdcAFqAm
	k6IiFLGgkKGqWSrxpxtuaH3PGhta9b0fVwvf7PGRax4TYMTXwHt/toKk=
X-Gm-Gg: AY/fxX5nq6lxdfRoi6JDfSXGF4h7d6+GMDkk7JIOP3W3ncrcU+LaksyInclpk9Ps7y7
	hHpW0lhz+NKeaKUX65qNS915nCxBR50HlIpRH7Hzv508Mz6gbg4csYhDC2nxQvDrl19H1nMLSWf
	IlyKvWz0pCTexu9f9zK/lUXldI1erVV7t1JJH6CNDEkyPDNfzKPxvVX0NKhxEya8SO2QERlxvKJ
	fTnG97iqh7rk8NYrBqSirDGNTSIRbSH3Ot/4UASd0selwrOfgPhqu8alGNWyQIvhJO0evadrRNW
	CUcklaFsfbfdcVvCUm5iyNqJTdgL7zBSCU2Vt068hXGn2JhNpYodFbyc9AoN
X-Received: by 2002:a05:622a:107:b0:501:480e:9778 with SMTP id
 d75a77b69052e-502a1f33448mr5477561cf.63.1768506068782; Thu, 15 Jan 2026
 11:41:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kelly Cullinane <kelly.cullinane@oasis-open.org>
Date: Thu, 15 Jan 2026 14:40:30 -0500
X-Gm-Features: AZwV_QiCUD40vlVCTdM7O8UfpvYPb0gzCOzb6AAoboIG-nXgaS0ahjul4T23e-s
Message-ID: <CAAiF600C2uvBFPBPec3-KaOq4nAgN3LdKi3+h=RkvDudVTB-mQ@mail.gmail.com>
Subject: Invitation to comment on VIRTIO v1.4 CSD01
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OASIS members and other interested parties,

OASIS and the VIRTIO TC are pleased to announce that VIRTIO v1.4 CSD01
is now available for public review and comment.

VIRTIO TC aims to enhance the performance of virtual devices by
standardizing key features of the VIRTIO (Virtual I/O) Device
Specification.

Virtual I/O Device (VIRTIO) Version 1.4
Committee Specification Draft 01 / Public Review Draft 01
09 December 2025

TEX: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csp=
rd01.html
(Authoritative)
HTML: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-cs=
prd01.html
PDF: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csp=
rd01.pdf

The ZIP containing the complete files of this release is found in the direc=
tory:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
zip

How to Provide Feedback
OASIS and the VIRTIO TC value your feedback. We solicit input from
developers, users and others, whether OASIS members or not, for the
sake of improving the interoperability and quality of its technical
work.

The public review is now open and ends Friday, February 13 2026 at 23:59 UT=
C.

Comments may be submitted to the project=E2=80=99s comment mailing list at
virtio-comment@lists.linux.dev. You can subscribe to the list by
sending an email to
virtio-comment+subscribe@lists.linux.dev.

All comments submitted to OASIS are subject to the OASIS Feedback
License, which ensures that the feedback you provide carries the same
obligations at least as the obligations of the TC members. In
connection with this public review, we call your attention to the
OASIS IPR Policy applicable especially to the work of this technical
committee. All members of the TC should be familiar with this
document, which may create obligations regarding the disclosure and
availability of a member's patent, copyright, trademark and license
rights that read on an approved OASIS specification.

OASIS invites any persons who know of any such claims to disclose
these if they may be essential to the implementation of the above
specification, so that notice of them may be posted to the notice page
for this TC's work.

Additional information about the specification and the VIRTIO TC can
be found at the TC=E2=80=99s public homepage.

