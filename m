Return-Path: <linux-gpio+bounces-36003-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AVhoD3y292mulQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36003-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 22:56:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DFE4B765A
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 22:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96DDC30075E6
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2026 20:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3624F39022A;
	Sun,  3 May 2026 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCYHiwkg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A243559F5
	for <linux-gpio@vger.kernel.org>; Sun,  3 May 2026 20:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777841783; cv=none; b=sARJSQhvEK5DRxdxl/DeCH4LgC3J+jUfxeRxcZs9jtSuczmWLkeOripoKat7QY803wuEjquU3vdMJL/DmDTdU8buBqPUiQz0cNeYzmki1BzMB4Jxfqm8VoGbrbpxc/w6wcl25vNiZ86/nsWLmQ3RnWd+Lpu878IveLdmQJtF6j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777841783; c=relaxed/simple;
	bh=X882GCO+Dvlf2ebX1aZh7TkhwiTLTaW9iuH+RMqeYYU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=SYe4F2t8CY6Xm8PrLsdiQnpOOI2E2Z8QXc9l8AkbAwLCpkSiox848q0QKAXQz75SOS+oeY9XddGL0HZo3cvVkB00H+gz4L0OVT2i5s4r3Wzm8Q8Waxsmq9/IpHHOG+qr66UeRSPEo51gr+nEj/RF2+fRHEz0UWN00HUrEuVX/aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCYHiwkg; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dbcb467f2bso3281797a34.3
        for <linux-gpio@vger.kernel.org>; Sun, 03 May 2026 13:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777841780; x=1778446580; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4qRCFUgyMlFXryUo+UrBwsmSJQu18VkeGRzbCwuX5w=;
        b=RCYHiwkgXaOzIgEKpsfEnRCJKhkVgv7iZuOIrOQEClbxmxCnZ76zMLMc5B8thQaVAG
         CAYsSLiUsnCUY9R1m0GdLWYRUMCsTOcPww+ju930pjpDtG3ZDKhpETdsm9JJnnqxLWvA
         dAVIWMqFJOb4aGV79pIL+6pkqKncNVmH9wwCBdyQve65dcGeKF3pqiY64f2ObeaWBkne
         yySlcLDT5wZZOn1zS2Uwuury7533exEsZXvoMac82T1Al/WUTmnv3SXgubN9bFD20CGo
         2LLAHZjYDZyKDqcQEa32Au3KgHt8Dmc+31zRkRR/XC3e/r7/fKbi89mrTDDQCQIeLJN8
         X2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777841780; x=1778446580;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4qRCFUgyMlFXryUo+UrBwsmSJQu18VkeGRzbCwuX5w=;
        b=FYoYhOvv9ytnuJc5jffObjFx8J1Ez8J5i0pauV4vsQUoamoVRvtip50GbKEU8MN6Zq
         aGOJlF0ZAlmBq0o1HF22fVuzgUV8BBzvi7qW3nmAdhdy/1FwlGfUsw7W7MPOmVavVNpE
         8wV6TW3BOVQckLradWc6e46bX5V53u1HT9dY2sKSVK4zgg7yBFAPkeJO8TjEAGhnOCqx
         Gwp1nhbJ0H4avLrf4ZAn6uFWAhNwXBpTV3IwlwGGkom4SftFb+37dujgeOqjDIbxY+qo
         Hycyp1urGBTCfXHi1cJuv0YZJAIcLwO8u/SFAt6P+NTF+aDTGtinZm40Ho1x9eE+v5Fe
         nHcA==
X-Forwarded-Encrypted: i=1; AFNElJ8kKB0nIo/NgGuoLWVwlYpci3f/vtQbks0p3vvpx+5bg/bz15j+RytDpA/iGUFjZDeXsNWO/WoPBBLI@vger.kernel.org
X-Gm-Message-State: AOJu0YwgcIzPJAtXvxdsugeyblLXoOscB6B7bT13E4rT56qmAKTPMpK6
	es2OSRdsK2JvN1PUzhGREzYRDMwE2fSXKu3wCjr4bFvCsRUX+731CrJ/
X-Gm-Gg: AeBDietYLecmOLr3+dsa1zGtjlAfnuKBmjC8hseVzj0p9M6UoY/HpBSgUanH/YY+h+W
	8kdGCWn2h7m/9t2t/iugaG7znYsMsW6x7juM+4HEFXBhUAmLLxbDntgn8GLd5Go/oaLvvsb7ahc
	c026AlWm378b6bRWLhIt98LMmfTLYdyxDTd4bTgYHlWDGahkIjPMQ0OwpnBai7eWlqvma4mij4e
	Em23pCusYfUAcMx5fjK6ljCo7NQysqeYJr8+53mAU3M+dZdcCSXw4vYul9DPPKqhhJlg2tP+8/R
	iTnz24/x3hRir8marCMx2vnVzB2L1G0JuX/8ESs7OMtr22w3XiQaBOS9XUnrZuOt7M9fKn36Lty
	H0o26cjuqmH8QmODGQ0qJTKYtC29yNOhxgMADfTMxPLzgCnf94prT5CSngq8EdTA16Zc+I0N6rz
	z8/qeaT2VU5ofd8Rjcpm+Ed2ZDxqi4pvuciQNsBQnD/7s7Q7FYqV/HfuYEaFJZBzhk0ks4rnw=
X-Received: by 2002:a05:6820:1888:b0:68e:3f3b:8690 with SMTP id 006d021491bc7-696979feb08mr3582426eaf.21.1777841780608;
        Sun, 03 May 2026 13:56:20 -0700 (PDT)
Received: from localhost (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69689440f5asm5146886eaf.1.2026.05.03.13.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 13:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 03 May 2026 15:56:19 -0500
Message-Id: <DI9CBAF5FQU5.P8X4WBBUR6FZ@gmail.com>
Subject: Re: [PATCH] tools: gpio: fix buffer overflow and add bounds check
From: "Maxwell Doose" <m32285159@gmail.com>
To: "Zhang Xiaolei" <zxl434815272@gmail.com>, <linux-gpio@vger.kernel.org>
Cc: <brgl@kernel.org>, <warthog618@gmail.com>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260503190016.13439-1-zxl434815272@gmail.com>
In-Reply-To: <20260503190016.13439-1-zxl434815272@gmail.com>
X-Rspamd-Queue-Id: 79DFE4B765A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36003-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Sun May 3, 2026 at 2:00 PM CDT, Zhang Xiaolei wrote:
> Replace strcpy() with strncpy() to avoid potential buffer overflow
> in req.consumer. Also add validation for num_lines to prevent
> out-of-bounds access to req.offsets.
>
> Fix incorrect ioctl name in error message.
>
> Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
> ---
>  tools/gpio/gpio-utils.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>

This looks like a patch that could be split, since you're adding
NULL pointer checking, a potential overflow fix, and a style fix all
into one. I like the idea, but we need to split functional changes.

>
> diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
> index 4096bcd511d1..1afd9dff2bed 100644
> --- a/tools/gpio/gpio-utils.c
> +++ b/tools/gpio/gpio-utils.c
> @@ -65,11 +65,15 @@ int gpiotools_request_line(const char *device_name, u=
nsigned int *lines,
>  	int i;
>  	int ret;
> =20
> +	if (!device_name || !lines || !config || !consumer ||
> +	    num_lines =3D=3D 0 || num_lines > GPIO_V2_LINES_MAX)
> +		return -EINVAL;
> +
>

First off, this can be split into a different patch. Secondly, I feel as
if we should make two if statements for this, one for the NULL and 0
checking and the other for checking num_lines. And returning -EINVAL
will be ambiguous for the caller, so maybe change that.

>
>  	ret =3D asprintf(&chrdev_name, "/dev/%s", device_name);
>  	if (ret < 0)
>  		return -ENOMEM;
> =20
> -	fd =3D open(chrdev_name, 0);
> +	fd =3D open(chrdev_name, O_RDONLY);
>

Another thing that can be split.

>
>  	if (fd =3D=3D -1) {
>  		ret =3D -errno;
>  		fprintf(stderr, "Failed to open %s, %s\n",
> @@ -78,27 +82,29 @@ int gpiotools_request_line(const char *device_name, u=
nsigned int *lines,
>  	}
> =20
>  	memset(&req, 0, sizeof(req));
> +
>

This seems like a stray change.

>
>  	for (i =3D 0; i < num_lines; i++)
>  		req.offsets[i] =3D lines[i];
> =20
>  	req.config =3D *config;
> -	strcpy(req.consumer, consumer);
> +	strncpy(req.consumer, consumer, sizeof(req.consumer) - 1);
> +	req.consumer[sizeof(req.consumer) - 1] =3D '\0';
>

We already invented a solution for this in the form of strscpy(), so
please change this to use that instead, something like:

	strscpy(req.consumer, consumer, sizeof(req.consumer));

>
>  	req.num_lines =3D num_lines;
> =20
>  	ret =3D ioctl(fd, GPIO_V2_GET_LINE_IOCTL, &req);
>  	if (ret =3D=3D -1) {
>  		ret =3D -errno;
>  		fprintf(stderr, "Failed to issue %s (%d), %s\n",
> -			"GPIO_GET_LINE_IOCTL", ret, strerror(errno));
> +			"GPIO_V2_GET_LINE_IOCTL", ret, strerror(errno));
>

Another thing that could be split.

>
>  	}
> =20
>  	if (close(fd) =3D=3D -1)
>  		perror("Failed to close GPIO character device file");
> +
>

Might be another stray change.

>
>  exit_free_name:
>  	free(chrdev_name);
>  	return ret < 0 ? ret : req.fd;
>  }
> -
>

Maybe another stray change?

>
>  /**
>   * gpiotools_set_values() - Set the value of gpio(s)
>   * @fd:			The fd returned by

I like the idea, but we should be splitting some of these changes to
follow the atomic commits idea of the kernel.

best regards,
maxwell

