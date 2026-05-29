Return-Path: <linux-gpio+bounces-37659-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOO0FKg5GWpVtAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37659-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 09:00:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC0C5FE424
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 09:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 289173009141
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 06:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12047329E79;
	Fri, 29 May 2026 06:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltxkcw4a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94687223DC6
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 06:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780037784; cv=pass; b=I+Rc7cbaTyOfEdvNZNVJuHKrtG+DwCPzSQB1TvcQQic2aBbFDxV4K04+qCKE3lrmlnHTT51sAv8LC9xpB+lkn39+CulKbxeIk/QM2NDJ8mVuQXlNRh14e2Hp0suvH4G/O2Zw5HY1dZf7BcDZeoivFypStPYa60izzqhbMUAe4uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780037784; c=relaxed/simple;
	bh=xB+Sur1GqPbjl5ET974ruqqk+eG+zLGijo7T4vkVNnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6utWqD1mQeop/l+dsktVL5XUM1UU9RYHJnwDADj1u/wtmMcLg86HE0pDn3juq1wD+lstFBcd/zhC/UEw+XCbcRbdhqQ1PLuTEebRww8T6K0YkG37IrU2ryDvrEpIqAQWYH5g/jY1nQqDjSTEUgUJrqbWx99lZ3PXoP6MJPE/d8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltxkcw4a; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-660390a8999so1931177d50.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 23:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780037783; cv=none;
        d=google.com; s=arc-20240605;
        b=huyxZHACCAjaz+5u4qrxDZ+fF6m4aDu1snVY/Nf4AYOuG+OUyeu5EZk4YDUciEWvei
         pghI9al49Mv17KEQtKVoP2SOu3LnhjcJlckXHWJVri4dOBjR42kvjCweWLHsZcZ71tJO
         4Eb72ApLLsS72/lkH9hpF55BbzwoLALHcIZKDI5VoMSTZdxn1I91mFyfNd6Qs7mIiPGh
         fqCcjgWojYCmq7t4yRYHkkU61XN+3Y8gi/0PcjnXhH1s5zAk7HpCE9rItD0Cp1TqnwMB
         wWGKBvfL8VPe+KLT7QqjAB3SmxajrrLbbHNdkTt02o12LWM97SkQoW/8QspMxdMnPww/
         YJBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q8F9cvCOm3X5D1v0nxPYlv0+DQo5Uw0eR/Z0LcoLAGA=;
        fh=n/I/Q6du5S9EvXRRWn7BqW3fh7MfQjGvEcDjJDYZaT4=;
        b=k2RwRwCMCN29EJFoKgFyjyZc7nXV8PR3Rx3XLWUMGMftMxH3GTCHff3h/gsQWhLCTz
         oOMAYtRSjIwglTRtgVnKyl1Mb2SCJH8BkjldDxnpD798RY/d4KlBH9KbhIcYZJargNtk
         nVG2SOBrNHaNyxzmwRIa9t8tU78LtYYTsOVbowcvCsKYVYpJS9c4hGVG2XxExpKGxWo2
         DawzzJGhb90g6YM5n12iuKgMPYe46a7dv7321NA1dIh3xfp7SrXDiGtEnvDMKnjNHDtk
         0NnEmd7DbHUY92vfXxDO+27E3WhdZErcEY+WupPOZiYlfmdTgLgBQO0/+/ijSh772faK
         q3qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780037783; x=1780642583; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q8F9cvCOm3X5D1v0nxPYlv0+DQo5Uw0eR/Z0LcoLAGA=;
        b=ltxkcw4agSsVf6BeyrOuKCGeAp20v5eGln+OSjO3LgXVGEv3+2YjlNRMK+RS+jz2cE
         neUV1WtviGgpBccsoK/3+7po/Ee9p5cNebq6/xjiUR33vDw3Ny5TCFW2sGvvL/ZItxph
         tj+p/CyhqT4QJhGAzY+IF7GMp1p0IObYMXIQ9evggCL3nqi+hnVmP4kd75mjmYKtA5Jf
         A/C1qLMEXZ7Q0rejRJNQO2gPiNirCMt3w9c7Rx2/cKqKVv1DbM28UBt1EfHBB6jWGOQb
         ALje5SdxERELnCNCwPWRtuQh/RuZTwpJynlVpNtxwsbCr/4pr2pjp/HTai/WChghyuEm
         Vcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780037783; x=1780642583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8F9cvCOm3X5D1v0nxPYlv0+DQo5Uw0eR/Z0LcoLAGA=;
        b=bdJEHpbh6UWixa4PeZtMd6iWHk8cTW5sWAmIWTYGu53DHrtcc9KigkChMCmD/LbdY2
         eTFkvCIrFF/wRea3Be9r/0Mi6CragJoo+U4l9Ljjv9I04nGXqxtsqE9ZHE7tQzQr+Nb6
         9sd8kBjrI+rX2CdWlHPxn2QXidzMTJ13CzivZMFt6YOIPDCMGUyX8Q2jP7yVhprrOati
         hBFuGbQBfz4o1BT9Lddz9Zpn1ir9rz0IeByNctgdNE0mShiFas7N7FFptVumO4cWcQQG
         2RPQXTTXXZTLIXHrwGa+2KywMkaJH/PGALT3cDzbZPaQzH7Q/rUyxpm/Zx1oqSfh4n49
         Ly2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8rrCQSHBRryI4XYBX7tqdNbP8pcIT7lC7M6Sis3cNZwNHgVY+vXesU1Er0t1224TU6di3TWeA09zMy@vger.kernel.org
X-Gm-Message-State: AOJu0YxocZTdMNHg4fxVRKsJWeo8IqaG7zUOKGD+gJfTiMcVa01MGtPl
	nrqMQHA1Zd1wg+AVFBsgGHE2OgTkfbs8pt3U2rxGaJNceMm0+uqBqLE7tvpTEAL4TTOz1CUWdnE
	VnMYCVqy5wwuWWG0knglmY0p6ePhcYF8=
X-Gm-Gg: Acq92OFaX0+0rP4s1Puluy2KoACx4Z2UvhicRbLcd6duIlT6E7i9vgWySQhReZLUEi8
	05ClLb+Bj1pmZT9VUVU0P9etSnQVy/3MF4rtYoZWD9wD77ayJo5ZiEGpaDTF8vBNd+4WIwANdnB
	XAnTEGEnJrmbseVzIVizramUYpXlJC9R7RbczgUEaYhgdfMCJJhns+T16EIh+T2Yhs5id1JlRoL
	TbuP2eIwxF3f8u9WlEaVHKuFAenWbu/KZ5a62lZHLRXODQhOCczhPDKWwu8Lf58+R8IX3JoiAsE
	nNXXzVY6hG17VHsHV5RRa9dsBy/fuII6mVBFC0kzcquddznM0fKOBNJpcKI/NzPOiLc6VR+6RYF
	yUuP8yKguxo0jfkHeOFfmkQOzwBpkeAXPuYdIECgFySVV4xESr5G5WffuS3rY60ABr0DeyATu8n
	NOApdO
X-Received: by 2002:a05:690e:1209:b0:651:b8fc:5490 with SMTP id
 956f58d0204a3-66053101959mr967309d50.38.1780037782714; Thu, 28 May 2026
 23:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523174440.9629-1-hardikprakash.official@gmail.com>
 <20260523174440.9629-2-hardikprakash.official@gmail.com> <CAMRc=Mc7KrsmB4Svjoj4WMRa-=D2xitqURVRJVWhDH9qyzOVhg@mail.gmail.com>
 <63e6fdb6-1679-44f5-acfb-563ed3b56a54@kernel.org>
In-Reply-To: <63e6fdb6-1679-44f5-acfb-563ed3b56a54@kernel.org>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Fri, 29 May 2026 12:26:11 +0530
X-Gm-Features: AVHnY4K-Ck31Y2C37irW_tEewS0ZGz7G_MYT3OUSmVHgoyNuZ4eh5ZVQt5iPiFM
Message-ID: <CANTFpSVX8YZxY+6pMcv=HhHBRbkPymox1GHhSCoBHzknatnfQg@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Mario Limonciello <superm1@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	andriy.shevchenko@intel.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linux-i2c@vger.kernel.org, linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37659-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: ADC0C5FE424
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026, at 04:43, Mario Limonciello wrote:
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>
> Please make sure that we drop the now unnecessary patch that was
> committed from the earlier series when queuing this. If that has
> already made it into a PR to linus (as part of -fixes or so) we should
> get it reverted.

Linus Walleij confirmed it has already been pulled into Torvalds' tree,
so a revert will be needed. I'll leave that to the maintainers to
coordinate.

I'll send v8 now with your Reviewed-by and Bart's Acked-by collected.

Thanks,
Hardik

On Fri, 29 May 2026 at 04:43, Mario Limonciello <superm1@kernel.org> wrote:
>
>
>
> On 5/26/26 11:42, Bartosz Golaszewski wrote:
> > On Sat, 23 May 2026 19:44:40 +0200, Hardik Prakash
> > <hardikprakash.official@gmail.com> said:
> >> I2C controllers may have child devices with GpioInt resources that
> >> depend on GPIO controllers to be fully initialized. If the I2C
> >> controller probes and enumerates children before the referenced GPIO
> >> controller has completed probe, GPIO interrupts may not be properly
> >> configured, leading to device failures.
> >>
> >> On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> >> AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> >> pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> >> AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> >> occur before the GPIO IRQ quirk in amd_gpio_probe() has run, causing:
> >>
> >>    i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost arbitration
> >>
> >> Add a generic dependency check in i2c-designware that walks ACPI child
> >> devices, identifies any GpioInt resources, resolves the referenced GPIO
> >> controllers, and defers probe if those controllers are not yet bound.
> >>
> >> This ensures GPIO controllers complete initialization (including IRQ
> >> setup and quirks) before I2C child enumeration begins, fixing the race
> >> without device-specific quirks or DMI matching.
> >>
> >> The probe ordering race was confirmed via dynamic debug tracing:
> >>
> >>    0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
> >>    0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
> >>    0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
> >>    2.348157  lost arbitration
> >>
> >> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> >> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> >> Assisted-by: Claude:claude-sonnet-4-6
> >> Assisted-by: GPT-Codex:gpt-5.2-codex
> >> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=221494
> >
> > I don't think we use this tag anymore. Just make it Link:
> >
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>
> Please make sure that we drop the now unnecessary patch that was
> committed from the earlier series when queuing this.  If that has
> already made it into a PR to linus (as part of -fixes or so) we should
> get it reverted.
>
>

