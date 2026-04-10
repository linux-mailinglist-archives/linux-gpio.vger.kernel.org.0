Return-Path: <linux-gpio+bounces-34994-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBaMJiLK2GmkiAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34994-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 12:00:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E388C3D5559
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 12:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F24E6300BE2C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 09:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEFA3ACA7C;
	Fri, 10 Apr 2026 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rErJRG4Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB413A9D83
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815175; cv=pass; b=TlfkG8v/rqV/IODlYdaC/sBmMTzzPV+ox91xUxAZUsaTsPcDK6+XnCpQ2FQp0woAuj27B6I+cRsDDzVs9TTl9D8I2rBiyGI56ifVLMK0KK2E7htb+67jYyKYRLDwPEEKpbDj7JWkblYxriR1A7n3Fz5DoyxSfEXCLHhsZ2xFfp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815175; c=relaxed/simple;
	bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+Xnu9SBFwS5xUJ4smqvjGKWUfHUCGisUg9tK4cl6iCPfPjsqseEVEmsg0+7P3mBm5oNull7p2ugO3can+5Mg4k2d3inq0o4ulh8AYrV3C9T7l+2yO+dNAahAAfdZ0vZFlVUf0a/DSWlf3ObMlgH6OWy0maRfsOyTPDFNcpBElY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rErJRG4Z; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79ab5fd969aso20382067b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 02:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775815173; cv=none;
        d=google.com; s=arc-20240605;
        b=a7yVOrCrdijrsvBaiHZnw19Y4J8iBop/QHna8FBo1RLpcPkJ2xXQD8+nRZYjYW/tzu
         vObeQ/IBwKtyerdAa2+6TM54o9fwb1BuTnPctbhKC60Cal7Gtte2k/pBh7SDwSdgRAqc
         UuA+vT4UpJF5ESTdYrrCzvFQOiclmQCOhmwG+hAceM1SqFZf1qwKkEnu/TP5ZSCcbG7L
         s+cOIwRcELsy9/xhsH5x9t99K4SBOPAE9KhkbpZd5pNADjzC0jPHRG8KfInC+qpC3apG
         +4uJSD0EKGjM4MKOwNLp9+zXXA2rTCTaQGPPNmYftCuLD65HYJLoPgbzzqBMJ/nY4d2d
         /ZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
        fh=iFmXqwC/dcO3pu34AFfXIOfZkHXKdCWBnJdQvrT348U=;
        b=HRd3rFrMuougoEN6abSwSdOIhD9EAci2KG/XhQmtsSMcrjO5p2AB5w+/2t43Qp+Wnx
         /99ojXPep4NBNnZqhk1ZoXJzyyfRaKguwKFVXAQ4vB7G4xXMQGJA+80PMyCU//Yf21ix
         Tsu9Gl3UAOt9PakwhvJ7xbjnXj0JIiGoJ3S01yM87wZKWUEoeRd8gMgIWUWK5o3UuKYB
         MQzz9XLvqTjJ8ywR5mo8KuZVyYRYEKdzFXOabY1wyK9poKUKj+0P4uSMHIbteMqXa+Lk
         FnsEmzkb+wMijPj+XTdyTktMpPsMXKHaVHkLYgbGeSShIkun9OfmM/uT5gFV8don8wtS
         P9XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815173; x=1776419973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
        b=rErJRG4ZXVbUQMFbRFnmhepxOtcXBpodg5RLaOgBH+BoRSymMMJ7ImR40QJedCzbyW
         tMf1Kw0G48yG1WZj+bNeo4MywgSjIiHC6+mdUiWs/1trlCFn5wz1/AAEssiw7iJpV45I
         HfNU8cXmReN8Nsez829lTb/TBvUrr77OsqHawEgFSQ6vY1oOAVLWJ0U/Z4+fMTe/VFCg
         IR23/Yp54EUoq9dhxidWHZuyoQIaTlIzdzfge5/sD4+zoIksk5Yd0vqptdZ4fGSwlDMf
         y/S/uZCe8K9ouwDdws1zrrxjoze6PKxwMOQ8PgDitKmFK8vgUphQisVdc+pg/trHdpwt
         wTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815173; x=1776419973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
        b=aQRWlamdN+vU1YYoGgC7Ly0A+/uxIUqJbHwtGh6h/sRonTgRh4IaM3N5dubBlqMB1B
         8igF/96cgZ2FqowqkH4xoUVl/XMQWjDXbl74dXALLJc+TTnBcdQqpHcHPXCOYw4CROBe
         nzVYQ3ldfIXc4u+SdoS81eSbZe7StkJG6/QxeANzdARsKgtPrN5B7MJ2nWs1T1HVfWco
         0T30sANPinW6x0xwxVf+uP63ygttNJYgah55GENfi6CgfDvxcUjm86YylAO9W14LsgKx
         qxgB2++V3QWfE8uh1ZSvzY0OhmTE8ooTssgcgtR0tWdvZTgEAYZd52/+EeGmOp5H24fk
         p4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfWoL3t+3bg3rJIXWgaZXySSTOpDqiC5syEGeIvMu5b2eImd77Yw1qi1M1pUvfuIKeKW0LlU5/D0jd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoc01t6/efRXfoxjxyl/3oV2yfy2u0bC2AEk9z+kLBPnBISIz0
	l/TnARCzy9fTvgciwcz73bpLBn0CFpB7YiKm9UW6RMfhbF1SeqvkCHGZIlDDAjWmaJUPmjzGzri
	G9MbzkxpDC1QFz/JxG7L3IEOzZ8B+aEo=
X-Gm-Gg: AeBDiesRSntAMLBZvH9ys6mv75ujHjegBkgbM7BOWn1MuyjO3Zje9u20uuTeqTOiMH0
	0/hstzJujhroDoR606R+5KhBe+i504Be6VL2b14eXth/XPP9GMTjjnZIMMLraifEKnqloCkOOWe
	Yl+lp97+/Fe3KZFXKboSm5kl4P0qOFGUfCMTG6DDFK0r5jbp2kHlHw02Vj0L7arwZ+xGEubVw04
	WNWZ1w5zw7ZeOUvmfPDqdLihI1uA7+Oa4lVHgWN+TnvXs+dnfNqAdNBE5SLna/KLDWALgvLl5DV
	cIgtwTGw/kOKC6lkXl5LXqOMZ1mNxiR3240T1Xcl/g==
X-Received: by 2002:a05:690c:83:b0:79f:3715:1980 with SMTP id
 00721157ae682-7af6f907f77mr24281587b3.12.1775815173216; Fri, 10 Apr 2026
 02:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408053037.1867092-1-a0282524688@gmail.com>
 <20260408053037.1867092-2-a0282524688@gmail.com> <CAMRc=MeJL_po8HuBa4btVowR-e0i2FyzbDgNVo2u54iPKyuvWw@mail.gmail.com>
In-Reply-To: <CAMRc=MeJL_po8HuBa4btVowR-e0i2FyzbDgNVo2u54iPKyuvWw@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 10 Apr 2026 17:59:22 +0800
X-Gm-Features: AQROBzChhaENjKRgm1eiXEkKC5Ek3HBghHXiZXP2Ngye9h9-wWZ61ho7Hz-V2Tw
Message-ID: <CAOoeyxXqUbdd3Y0VorzVVOARVpoEkx033sYrv5Hs4tRfst2tOA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mfd: nct6694: Switch to devm_mfd_add_devices() and
 drop IDA
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: tmyu0@nuvoton.com, linusw@kernel.org, linux@roeck-us.net, 
	andi.shyti@kernel.org, lee@kernel.org, mkl@pengutronix.de, mailhol@kernel.org, 
	alexandre.belloni@bootlin.com, wim@linux-watchdog.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34994-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0282524688@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E388C3D5559
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bart, all,

Thanks for the review.

Bartosz Golaszewski <brgl@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=888=E6=
=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:25=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Apr 8, 2026 at 7:31=E2=80=AFAM <a0282524688@gmail.com> wrote:
> >
> > From: Ming Yu <a0282524688@gmail.com>
> >
> > Currently, the nct6694 core driver uses mfd_add_hotplug_devices()
> > and an IDA to manage subdevice IDs.
> >
> > Switch the core implementation to use the managed
> > devm_mfd_add_devices() API, which simplifies the error handling and
> > device lifecycle management. Concurrently, drop the custom IDA
> > implementation and transition to using pdev->id.
> >
> > Signed-off-by: Ming Yu <a0282524688@gmail.com>
> > ---
>
> This does result in a nice code shrink but I'd split this commit into
> two: one switching to using MFD_CELL_BASIC() with hard-coded devices
> IDs and one completing the transition to devres.
>


You are right that this change is trying to do too much at once, and
splitting it as you suggested would make the series much cleaner.

After looking more closely at the ID handling and hotplug
implications, I realized that switching to devm_mfd_add_devices() and
dropping the IDA is not a good fit for this driver. The current
mfd_add_hotplug_devices() path uses PLATFORM_DEVID_AUTO, which gives
globally unique device IDs and avoids sysfs name collisions. If we
switch to devm_mfd_add_devices() with fixed IDs, multiple identical
NCT6694 devices can end up registering subdevices with the same
platform device names, which would break hotplug support when more
than one device is present.

So I think it is better not to pursue this direction further.

For the next revision, I will drop this part of the change and keep
the existing MFD core logic, including the IDA usage. The series will
focus on adding the nct6694-hif MFD driver only, and I will add the
IDA initialization there as needed.

Thanks again for the suggestion and review.


Best regards,
Ming

