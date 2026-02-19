Return-Path: <linux-gpio+bounces-31848-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG2KHKHQlmkZoQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31848-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 09:58:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1799815D281
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 09:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 112FB300DF62
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 08:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458AB339B32;
	Thu, 19 Feb 2026 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nI9sL68S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14C933A718
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 08:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771491483; cv=none; b=PP43T8TeiFA0sErraEJgc6SYXGods8CV6aY6CV1IijPDO4DTy0jph0cAjugXvGFc0hF3oXxldQhdXLljPZJV0wejrBlFHXzvfe/eH5DVsaMttrK/h7M+jbgnkTs0TfNgsQExPgIYi1mK1ahBw3fFbH9L1ag+wUAl5x0iVZEE22Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771491483; c=relaxed/simple;
	bh=RaU7x6gSN3yYDniJgRhFDMbiZ8LZTpqr9r4GDly3Xhk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=LnR/uTHpPdRr5r2jDV39dkJi8CxLyZ8FFBQHAfr6+38XKXWgLqDpaLpIMJBOt6pjwzj7F4MJOFwBgrP78L764TIm1dq6s06q0UY/8UHSXphC9qddO3wDBC+0pQpMVQAekkwdlaJgUbZ56hKEpfuvs5sH/BXU0Sbds9klCrVQ4Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nI9sL68S; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-127423bea4bso1566863c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 00:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771491480; x=1772096280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w9QckPjYVpC7XREf2SsBK4wtYoxkxE+nJ3fOgUmSovk=;
        b=nI9sL68Su4BXNPdhkPvW+mUNhSF1mcbv/sx4CSzy7QsV57YxPoLosvbVAhEFgVWpRS
         zX5OTSfyE2TkStm4EaLaFs1vmC+2UMUdd8jHCQmDv2ovwOuKjVzZr8VlbOBy3Lf8Rc14
         Q17NqjH/1SW42GxFLcQNq5zGC0NGYbUaWV5otEv2YUmT71EhlRnv7QiY3Vn00MD0rCgQ
         kgjkkxaRkflvsDAKnpmvu7ef1ATQFeASjbzeGwi1ex5e8Mq/AgGBTkNrGLwF3jwIimq7
         ka4l2/xEgvCgreGIEi8fP5p6V3oTHCZvmVEqqdZkEpBG9CKmiQNWqkQRP2/3jFAkwxDo
         7OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771491480; x=1772096280;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9QckPjYVpC7XREf2SsBK4wtYoxkxE+nJ3fOgUmSovk=;
        b=BC169+D+K6UXTknmAyJ7HhhS6gt4AoZifNTAEtT6E6wS4YusqOvHHnUMxcrAmM1fLC
         IOCUNVYJaQWfWmrVNCCnJmkkowz2G66+DcyWZvRnQ5VO/eu/K/GPw/ZAq0VNhdl23iCV
         hmE29fn3xmx4NAhGu3kGPjIavdAlDhEIwlJ+MIDpm5v9Cc6Ov3LD8QU5X7feL/58YMzq
         HDE3EAnMMrFApol7rMxmcgz/k2rIo9lEHnXVjExKOQagqByxrShvshn4LwfSL5hfAcR8
         rtF42kIz/3PbQA6hI2HYUqSQ6W2pKoxex69E5ESjfA1LFeme4Kul663w2NOJjK2wB6mM
         A4eg==
X-Gm-Message-State: AOJu0YxwSCJtmai2T9HK/zrwVa4v+zTp5pZHX01lApJ255KZ3/2ng63a
	aj6Ai6EVnAjr3YuWA3SCNEzo+a4CqRXYCg9OQ4rFrvaixkdysd4PKtRmzDv0iQ==
X-Gm-Gg: AZuq6aLG1DYhYuTWQSDYXvqb3PzRPpmxOs+kKqt9ke5j3vL8a9JzpcV5s9Zkw4/gCIE
	B0gHIACOQT8FvJiK6roIpfiRjpYTzYzeHMBayV1PT5n5kVdsSReamJQvzwCZwn61z16taNT8Y2K
	RAdoydAauEszQBafyMk4L0eHtCuEXCRpodxwQt2ZvXXGzVdJbs8WCw6zyYYNIojhvgcyjOQR7WC
	/MhrWl0Z5kYp4LFcqHBJK9wKeJZ7XFfnQbsJUyFi1MQBRsjK2eUVmqSmISFVQ4RUmif1OIUTmGp
	GbodlLBjp2EXXmohDFw4jl+6SC+Ff9YARiG8/qqs7elBwrxEyWfgbGSmoq3787/f1tWlRpcFRhX
	cS/g3XqZ49gi23FwsfxOiXfaiaqA+iwsVk7JML85soFWLgyIHULQIJgtKNuHhKjBnj3NmzREvS/
	VwxPJpvAAOLHcQYjsTC3o+6Fwu9VMjcxvYGKolLsYyiAk=
X-Received: by 2002:a05:7022:f9d:b0:121:a01a:8e2f with SMTP id a92af1059eb24-1273ae688f2mr9613531c88.42.1771491479596;
        Thu, 19 Feb 2026 00:57:59 -0800 (PST)
Received: from ehlo.thunderbird.net ([2601:647:5e00:4acd:97bd:bbcc:96e6:7f02])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742b62455sm25648107c88.1.2026.02.19.00.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 00:57:58 -0800 (PST)
Date: Thu, 19 Feb 2026 00:57:58 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
CC: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_gpiolib=3A_normalize_the_return_v?=
 =?US-ASCII?Q?alue_of_gc-=3Eset=28=29_on_behalf_of_buggy_drivers?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260219-gpiolib-set-normalize-v1-1-f0d53a009db4@oss.qualcomm.com>
References: <20260219-gpiolib-set-normalize-v1-1-f0d53a009db4@oss.qualcomm.com>
Message-ID: <48629460-701F-438F-8E1A-6F428C49FF6E@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31848-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 1799815D281
X-Rspamd-Action: no action

On February 19, 2026 12:52:37 AM PST, Bartosz Golaszewski <bartosz=2Egolasz=
ewski@oss=2Equalcomm=2Ecom> wrote:
>Commit 86ef402d805d ("gpiolib: sanitize the return value of
>gpio_chip::get()") started checking the return value of the =2Eset()
>callback in struct gpio_chip=2E Now - almost a year later - it turns out
>that there are quite a few drivers in tree that can break with this
>change=2E Partially revert it: normalize the return value in GPIO core bu=
t
>also emit a warning=2E
>
>Cc: stable@vger=2Ekernel=2Eorg
>Fixes: 86ef402d805d ("gpiolib: sanitize the return value of gpio_chip::ge=
t()")
>Reported-by: Dmitry Torokhov <dmitry=2Etorokhov@gmail=2Ecom>
>Closes: https://lore=2Ekernel=2Eorg/all/aZSkqGTqMp_57qC7@google=2Ecom/
>Signed-off-by: Bartosz Golaszewski <bartosz=2Egolaszewski@oss=2Equalcomm=
=2Ecom>
>---
> drivers/gpio/gpiolib=2Ec | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpio/gpiolib=2Ec b/drivers/gpio/gpiolib=2Ec
>index c52200eaaaff82b12f22dd1ee8459bdd8ec10d81=2E=2E9f7a1a1ebd8365fe933c9=
89caf9e8c544fd9ba0f 100644
>--- a/drivers/gpio/gpiolib=2Ec
>+++ b/drivers/gpio/gpiolib=2Ec
>@@ -2914,8 +2914,12 @@ static int gpiochip_set(struct gpio_chip *gc, unsi=
gned int offset, int value)
> 		return -EOPNOTSUPP;
>=20
> 	ret =3D gc->set(gc, offset, value);
>-	if (ret > 0)
>-		ret =3D -EBADE;
>+	if (ret > 0) {
>+		gpiochip_warn(gc,
>+			"invalid return value from gc->set(): %d, consider fixing the driver\=
n",
>+			ret);
>+		ret =3D !!ret;
>+	}
>=20
> 	return ret;
> }

You want to patch gpiochip_get()=2E It could be that set() is similarly tr=
oublesome, but the report is about get() not working=2E

Thanks=2E=20
Hi Bartosz,=20
--=20
Dmitry

