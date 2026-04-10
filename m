Return-Path: <linux-gpio+bounces-35002-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMr0Oave2GnHjAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35002-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:27:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8453D627A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C8F9300AB04
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 11:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA0B39A06E;
	Fri, 10 Apr 2026 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="SdfegSQP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B6E284B37;
	Fri, 10 Apr 2026 11:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775820221; cv=none; b=WEOggl4CX3das8sRp4+2qOTNR2HDKyP20v0tJ+g8xAxObzbiewHttEGwOt3tYH45deHvoumYsbaVaF5HWIFKzVzHfenkzm0s60bmdD27Hj9oOHcmtvLQeMq4UalEgRT78t8KOlUjsrdZrT8wpX6PGGMG1Rt/WL8HaWUsTqerbJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775820221; c=relaxed/simple;
	bh=RhmR4AY5eKxoA4ztODIJPUgoCF8Y3TpS4s1qP/WsX2w=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=InjyFYtIyZ1ItyyfuYirciWdlEdT6042X8MLOKc3l7vHEh8sRugExZtwYVLOIJDW6H4xh4Qg1Uc1aimKxEKWb/+pxC7P4tvdFYRZPhjW3EXJjceLKrPuzUpoErtnN0YSGcj9Sh3R/+4LirgJ46NIo/6Ud+e+YXc261+rc/0seWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=SdfegSQP; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1775820207; x=1776425007; i=frank-w@public-files.de;
	bh=RhmR4AY5eKxoA4ztODIJPUgoCF8Y3TpS4s1qP/WsX2w=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SdfegSQPyFgkPMzi6CpqJEZGj2yXv+MDt9jq1kEKNqXNzSlgdKzpVAhpz+sLU9Za
	 q7FdliEfuIMh4xl7jKE0dZ6ncyN+ZUbb9tCqJ2TIqjAysrgyzUGQmTm/1UwOH53LB
	 krhGoSrGBzhG4fWeFKAqc2rvbUBSQjC5JuOarTD1qG0HXdC+i67rkFSJQs4JUV+Rk
	 XEhQWF6GA0GcVamFaLPhsuJLeNosD3/MJeh3+d8eHPjLEjDH8qs9fXr2JjnFR4KLL
	 gBMKgjcLBOQkYeVz2qE93trKpZFQrglgD5GDOPa5YCZdivOSfJ9sACmAS6dLm2yI5
	 K4bmQ2XoqZachpkG0w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.152.0] ([217.61.152.0]) by
 trinity-msg-rest-gmx-gmx-live-579dcf886d-m55dr (via HTTP); Fri, 10 Apr 2026
 11:23:27 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-0c216c89-50db-41b5-a3cf-6d8d85e224ac-1775820207197@trinity-msg-rest-gmx-gmx-live-579dcf886d-m55dr>
From: Frank Wunderlich <frank-w@public-files.de>
To: brgl@kernel.org
Cc: bartosz.golaszewski@oss.qualcomm.com, linux@fw-web.de,
 sean.wang@kernel.org, linusw@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Aw: Re: [PATCH] pinctrl: mediatek: moore: implement
 gpio_chip::get_direction()
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 11:23:27 +0000
In-Reply-To: <CAMRc=Md1pC_a8zSQqWWcubNG-1ret8Lf9sajVDnU8nw2gnXZiA@mail.gmail.com>
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
 <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
 <CAMRc=Md1pC_a8zSQqWWcubNG-1ret8Lf9sajVDnU8nw2gnXZiA@mail.gmail.com>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:nsiFwYnwO6yoNdxq/wTWUCCNgCSgDXDj3znIduSnNbnbsHE2Fqk2QHzhG0GUGfjTXrRtV
 NZXJyW8r14NRmPKDeRN5KpESsHKQsdWMyZb5LGyF/fdDGKcTDMqYeddmqSb07T0V4+/q8l8PUAKE
 bWYVaG1l+B+LG1FSK7ZVkDR8yxltTFTwjMpaxx+njSR7tOlxRn7BW98sb6I9otBrB+0byl+eZrF1
 45OcywftrGxNxqDDDxUgXJeIGiwziH0VhpV4j8I0e1tL0NxcaEqfP9k/ndILQApGWt5aCkA44DP0
 QNh5+/7GtigJfW6KfY978W/Qzj/Etxqa3PvnATluma5+FQvNNHAOEqFvnZYy8GMgWU=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eZ763dUvshI=;VnrD6vsvyZnodrNu3YnEoX8wXCs
 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
 WUMcQ==
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[public-files.de,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[public-files.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35002-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,fw-web.de,kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frank-w@public-files.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[public-files.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[public-files.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,public-files.de:dkim,public-files.de:email]
X-Rspamd-Queue-Id: 3F8453D627A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


> > > Reported-by: Frank Wunderlich <linux@fw-web.de>
> >
> > please use the email i used for SoB in my linked patch (closes link be=
low), the other email i use only for sending patches due to mail provider =
limitation.
> >
>=20
> Linus: Can you fix this when applying, please?
>=20
> Frank: Can you also leave your Tested-by under the patch?

if my testcase is enough (just accessing /sys/kernel/debug/gpio via cat)

Tested-By: Frank Wunderlich <frank-w@public-files.de>

> Thanks,
> Bartosz

