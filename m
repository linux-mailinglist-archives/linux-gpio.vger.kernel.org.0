Return-Path: <linux-gpio+bounces-34606-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMNeKEmizmlZpAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34606-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 19:07:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFCE38C5CC
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 19:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF9EA30A5616
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 17:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5703B3921CD;
	Thu,  2 Apr 2026 17:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZgzeMQT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37930289367
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775149318; cv=pass; b=UDksE3AQnYAMN46EnfV65tjPKqMnvW/fhtwuBeVyK79QKSNu4qIT2QsMT8sj7pgfR+4+tLOC8nhIt1ZMem5xYzJxTujdR/RWw2kHd3DLmC/UtPnh8oINXRKWm+HtHEZwDBPrRJtJ3KbnSS7gsG1rCZCyX5vTUnppbB54VzvAirE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775149318; c=relaxed/simple;
	bh=sftbrBads+qg86uWFYbjY6FI0mzy+rE7NN+FFIMkAF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NN5wvLNu/byj8ett3cinwGFwFHLgk0XzorkfYf+9dp2gcnBW6+Bz+UAdUdJJUpF6BqBzagByKFDqL02NbT6JhB6AoD5WoXa+wT/kWKkErzqm9sH2HCAzu67P2RUHNX6N1XS6choQSV/tmUWyC1lRCpKIz4QlTn+aIHVwvQtH9Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZgzeMQT; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6501d242e2fso1054233d50.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 10:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775149310; cv=none;
        d=google.com; s=arc-20240605;
        b=ft8iXszEnbMnJhLtF3B8qxD0Iid9XkXDBpl1MgRQ1iimDvmKigdgOo/hpfBsDeYtPg
         rnLqRscIk8BR0wrsIU/MYDfmNrXkgddCLQ7FPHWLh36uZVxwPh4t9qHyNNiJx5cZ/XAC
         kCdBxUIkI7gVnIaS4rC2aPDANMcO3XDF0IbXiNPdF2N+gnLrFFCaLtGolL6yBRQMKFg6
         oGzujUVzUB/Ej49YDfmmXuTZ9S9zcus4xPURSXVTN1pPxuSV2fA/FKEVeMWx5wrxh1Cf
         UfSY5t7Icxb5Use735AGPymjDJGlHH4jaEL2tahUzdzfbogBXyhaBUqcqCmtSljRlQql
         L1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sftbrBads+qg86uWFYbjY6FI0mzy+rE7NN+FFIMkAF4=;
        fh=lVbY9JkkIKGU0bgEFTL/gADrkzuiP+/5Ir7IXoxPEiY=;
        b=Gkoxa/y+zFKmS5INV4ChEghLo8CFVg+SV+kNc6JxXIw6vUN6M7PnYOVEEZOVYdq+YJ
         8c9YjViXN742MsLc898h1FEO8hfcmU4E+U6lTxlUCXn/o+QfIm0V3gdkmrOhFCblktFw
         90IBMX86iFQWmKQN/eZX1VTaGShSCN8DZl/S1stxY0kHdahBGAarb/TIMospJJBW+0k3
         bwh2d14BuejpOnUkeXhhIxwxpI8wrvSrQpoBe5xlqHm49yIbjLSGVnghHBSONBHbQzk5
         3KnU0i4nPRsjBCVWLh6BvRyYQMlJrlKptpRhnIv/1OZPJUa3gths1dVpeZhbmaGKMsfy
         5RXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775149310; x=1775754110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sftbrBads+qg86uWFYbjY6FI0mzy+rE7NN+FFIMkAF4=;
        b=JZgzeMQT9uziPoqrXeHENL+guW0lWvWc74Zv6y87gAyrvachMz+1gNg8yMTdvEizoy
         2nDKN86w7Sc/d6LWmnX6K31+29TRx09q2+VkaTorMrZaWG/lt3BB6YzhjMPM+Oh1fw1E
         3JFYIp4JdJmRHXwLpFPTOoDPIL60sdvhHxmuJVoW7w5ywWjBiCAV6K+xyFj+ledkJsBk
         h3nlgDK9vlXZ8QuGDo+1cjwkWw3jtJ4SNBVW4UPjxpEEAO8uI8I0/QSsRenj6Cg/eT7l
         0QLZCSld7c9kb3ihZF5fXynMkDDB42EAiPIUQHrA1wgr5ZHpIg7bd2oplKNuL243L8yX
         0dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775149310; x=1775754110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sftbrBads+qg86uWFYbjY6FI0mzy+rE7NN+FFIMkAF4=;
        b=UjG54M+/NIyHbr50s6BwjjkWR1jZ1xj14Rg/vLDdhZ1XDY0yqMl7zTPle5KRpHppc4
         f2My/7wo/0oqfBzlSD5YlUjmm7stWCOVNJyhChnb/u8zKSfHBRLuWBPJHiSzv8aX4fmO
         +7TL9csmPDyzrpCwxAuDazyifu7YQESIWKiNp9rE9EgTkOJZGr/XlXyU0QprscAYFSAA
         hhvbqNzJ5XPOm8JIyDUJr5eg+RPmZ/CpghZ5N1njnc2KjaE+x4LKQA578N0cgDio+OAU
         5mUrCrGK9QG1JsGBp1spkRx0Z3beC/a/RevGmhlo6jNj1rpn7wT4ThCQEFcmGeuCkZkj
         5t3A==
X-Gm-Message-State: AOJu0YzgGM08FENc7MtDEWmnBOAP+Q5ypAPF4niErdi03conjFZFroY2
	8wPsNLOnp77+QUV3npJ82xjk40hiL473QVre22jXgOeJr5vInyG+06/btlERgolRFsqunnoJ0Fy
	w5XbADVupGlUOmEkKwvlCDgSDBMy23EqBEn+P
X-Gm-Gg: AeBDieu3/kZ/C1407Y6jDoLL7jpkjL7Gw5/+5nqSmF5rl4DfmtjEnKwWChDWeacBrJc
	PuU4xon50LKnsVw6jzNVxbPYxYFulngF+wLZ5zPm8Vi3tyOvi8CVlrJUtcbC1kWiInPMscP/bh7
	MTWvQKhl1RWBCnPAyFqWf8Bxq3QpDSDKo53A0QESFId5glIwV7GcZ9+OZZA8APfnM2WI6nLCa4r
	kOjipwIGNXEuNcl3Todjw9kdFF2IlvEb3wWatY1m9Uv73PdLxFP4M6sH8bympecZN+oZvsJdT37
	B3WLVF7wILe2QgdXiNMYGUfJ4QyaVDqYdpY9pu0=
X-Received: by 2002:a53:ac95:0:b0:64e:7a12:18e5 with SMTP id
 956f58d0204a3-6503bc054f1mr3737499d50.58.1775149307894; Thu, 02 Apr 2026
 10:01:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401001459.19159-1-vfazio@gmail.com> <20260401001459.19159-9-vfazio@gmail.com>
 <CAMRc=MdbVb4cXGE56eLOpAe33mgBKC971K-W-z8mUVZh_aVsJQ@mail.gmail.com>
 <CAOrEah6BHFHeCWxqzR57jOrAaJ7h6+_uwBn8bTFMr4x0oRffOg@mail.gmail.com> <CAMRc=MeQ+AXkXiCbELywekSEOsd3N_DZf1YNMMMYy=mCGWVLEQ@mail.gmail.com>
In-Reply-To: <CAMRc=MeQ+AXkXiCbELywekSEOsd3N_DZf1YNMMMYy=mCGWVLEQ@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Thu, 2 Apr 2026 12:01:36 -0500
X-Gm-Features: AQROBzCrwier2ODhRIcmBemX0j-N3XbD2UD8eclc047a3rdoIWQ_LEvi9RzO4RM
Message-ID: <CAOrEah4FxteUvZHn-zN2fX7e7cvfov4gVw-AKbzgANg+ur6wZA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 9/9] bindings: python: update linter configuration
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34606-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0DFCE38C5CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 11:43=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> > Some repositories try to implement these checks as part of pre-commit
> > hooks but I wasn't sure if we wanted to go so far as requiring these
> > checks
>
> How about making it part of the dist package generation?

If you think it would be valuable, that seems reasonable? I don't know
what that entails however.

It may be "late" in the development flow, as in, at the time you want
to make a dist package, the lint checks now say that there are
suggested modifications or fixes necessary preventing you from
building the distribution.

Ideally the lint checks are done prior to patch submission to inform
users that they may have overlooked something.

It wouldn't surprise me if I'm the only one that really cares about
the strict type checking and formatting. They're obviously not
performing logic analysis; they just make sure that data types are
correct/accounted for and all code is consistent in format.

