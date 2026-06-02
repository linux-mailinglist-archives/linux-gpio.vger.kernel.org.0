Return-Path: <linux-gpio+bounces-37836-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OOTxDfM0H2rvigAAu9opvQ
	(envelope-from <linux-gpio+bounces-37836-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 21:54:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 881DC631917
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 21:54:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="QpK/VwTe";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37836-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37836-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 495FD3032677
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 19:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E702C08DC;
	Tue,  2 Jun 2026 19:50:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7754634EF1F
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 19:50:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429850; cv=pass; b=Qg7qMl0eWE1RE9ee/DcmUF5cEO3FfG6HlvYCqq9aqoiINPSOkfonC0LItSnfdP1NTlToyeFgqM21SVZ0m4TnE3AqbvxNFEs/x5IuQDSTFH7BjYoRYMz8phidgL7NcLXOsX5m6VG8jMHfljIWVoXk9VA/JJohmecYGtIEungr6r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429850; c=relaxed/simple;
	bh=J45nwhea9f9olm16V+BBvXy/k/57kC760j+0uwbt4Pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iW/WfyRJceqckGRYBAuD9vwiGWRDQp553D1KFKHlWUS/L9X7QDEnp0e7ce5zzsllaWWEoehHrRDgVFsVbR7Lp3Kzoi49Qii3ocNMCHER4+FkdBbEED9nLWzRm+Jve9ZP5vEnMpquumjcATwcquFAzLPf4We1/2Up+gSyOfHQ2G8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpK/VwTe; arc=pass smtp.client-ip=209.85.128.175
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7dd7818ac2aso50792617b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 12:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780429836; cv=none;
        d=google.com; s=arc-20240605;
        b=K5N9+wMcdc32LB1CXVhcRC/l6Zypz2mBvX/q34savNaPJAhQcVVQQtDb0J7JEojQHj
         QzDAKTcBYRykbbTAJQt9th5ruppDl8bYyTnBSxFjD8JPBmeB10zYnDOf/1IkoFcUeJCa
         1lF+7iAB7GuaB0A/oInn9+Zso9zbboz8qazvl71i3kTNTh+aD2AebmrauFfKoEucQkfH
         w5HqF56TiOKleYsVxJcLhgduLcE0WNgyX9tJlRyat0NxP4F6aFLhgNZ/Z8/nR/Bkc3YF
         p4kBmk7zJBzIvUQWAUx3yWLNcGe9F7G9HP6BkLW9o8urqyED0dW44J+u4s2RXiXG2jvo
         gnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Al3rwWp3zUx80yaxoVbyfox6wzbYBQTtLuZ4Tpteh8I=;
        fh=2mmof5eBAps1x8J+hX2fV377e4Zw03XnO2i+jrgigiQ=;
        b=D8qKuBfqB3CR5b1Qw53eZy8V7JsS3ibUbiOf7NKNuzfVlsGW7cCaLwK7/fmMFrriPV
         yYif9M6jAvsO4ufWorctzKbOmm//ex734gS/+tFCyxf15aLj84YxparZbRJyx6RfQgqo
         AdhrcukBs89AZaQzOPrR9m1seed4imgGQAs0w5diooUt1ScqIGoLVhwAS8BRUt9PrhXR
         wKKVnHzCbblaCfElqOgR9n3Il8Nzcnhd0XiBj+11iCSOMbdysbKsvImLvNlWVVg2Rbt9
         D8sh1h0PM9wHQZYoS/TM3cuDcn9bx7vuk7BTpYpZUlGxmwPxKx2pW590qJT9ZC07ONJC
         nO8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780429836; x=1781034636; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Al3rwWp3zUx80yaxoVbyfox6wzbYBQTtLuZ4Tpteh8I=;
        b=QpK/VwTe4T1KLhdQlJ7zrnzHRkIyl1maZJvfmFfJXkk6ztj6AtaimNVvW26ajzJcMn
         Deo+UUUP0+2XfDmz1Ut/F1wqF1kZd46KF6rleMbfPWnc258/CMnMMznMKEXZa5rRQQj3
         QpJZMsiq7QVFUNuQlS2nYwV0MOX7znMfjbMdP+l0yt/F52viVlMT7hR1QZ1WOezvvZrR
         vZBGPRBhYuA04+2JbOBOhRXuBAiCy98FLRnL3b1YTcv1HphXNNabIVAYIg7doEaaAPvH
         sUGOgqYHpRH+3VRnuiSOUNSlRgZ/6x/syG4is5ci38HBqXtjmF1Dwfwah2fpihbGIWsY
         poHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780429836; x=1781034636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al3rwWp3zUx80yaxoVbyfox6wzbYBQTtLuZ4Tpteh8I=;
        b=E21q3RgE74ChN8tJgnIPkYqygMrTXzTc/cMLN9eUWp8JLY+pE/QgsuWqrj2o/kBlD8
         bOwTlwZ8l6zYUNi+Dxd1Qu4weE3dy7Pd69xUqMkyG8iMJ15YFMS5FI2OE4fS864qmKt5
         Rc4IDlT3htcR1LL7mjmF3viNhtM6q74lRADqC5Hj7RLRNmWQNDPVsHUtIQVDghx+olgm
         JUaGrCye42+KmOIIONfenWybh6uFBBMZD0L3Zm1mmy4rdbEQ3B7MhG/7dmorscf8lExg
         f1fEsLzmsqI1aRIsMyXR1JwpydSu4lv8MezOWt0Ec9vSVxcJVg9z1eJwSfQaJxNr2Uep
         sQmg==
X-Forwarded-Encrypted: i=1; AFNElJ9fkL09QoBYEutopvwH5//zUo+040Sxfm0W//Yy9cVzlbYiLv6dWrW+0IspVH5c0i7RIHvqlLfbM1bX@vger.kernel.org
X-Gm-Message-State: AOJu0YypYKhaT5yiG+hC0kkmFzDSay1dpKmuDYzVhoILRp8X5o8cH2xl
	bB8uttPS99elWtnM3lxBAWha8RPoMfNoGVrjzgPIj1DpODWhglMUplv+kU6mZSeYdetAkwqWYkf
	Rk+FtIJbqpzv6BoO30ZtS4qaJz4a+5kA=
X-Gm-Gg: Acq92OEYg7/zYF1bP2EX++k4AvjmOthGtq5tx7TW6Zp65kpHPlp9zeflknP0o3V4jKH
	L2N23o0kmvRLRSJ6PbnRwwbhIWwxSBeoGqwE27hpFm6Z28Cb29puGMvQ/4zhiOa/jwfyKkSTowm
	J+mxDpxvdslbM3t95AbnbeIUwkzx3SauTlA0gip98E9fGx1QYdk7Ferr4AoA/8KRrdkLjRM83l9
	MrM+9dU3MdjBTPDieQUNBjgi/OkL5b9YzQTBaIwMUF+oZvqBsctbRZKvBXSHd8FvpNDUGFN2taZ
	4v/2nV8O+k+lLn+cSpgVckwY4liklgOH+PKnYxW3wHZCzWC6+sURHJyLqJmcCYqQ2RwtYKhiQjo
	VAv0o9u7GzOid+8uU70cb5XRkeHZIdaGM3JBbrVsMYRV6frnpCLTP37hAaAq9JGCDkVUBDA==
X-Received: by 2002:a05:690c:c:b0:7dc:a5a8:89d with SMTP id
 00721157ae682-7ea49872db5mr3751757b3.10.1780429836496; Tue, 02 Jun 2026
 12:50:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com> <20260602185339.GA404948@ax162>
In-Reply-To: <20260602185339.GA404948@ax162>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Wed, 3 Jun 2026 01:20:24 +0530
X-Gm-Features: AVHnY4J4lsO4dRAVoHeZvlKwJpL15EtqjbgzcGJZ5ADm6FFAZWXDLWJU7PS7ofo
Message-ID: <CANTFpSX0Ehpno7b=xrnqzmENn=sfKj1UcyRzXvMyy4Rcyr7NhA@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	andriy.shevchenko@intel.com, mario.limonciello@amd.com, brgl@bgdev.pl, 
	basavaraj.natikar@amd.com, linusw@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:superm1@kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37836-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 881DC631917

On Wed, Jun 03, 2026 at 00:23, Nathan Chancellor wrote:
> I bisected boot issues with a few of my test machines to this change
> in -next as commit ef76a3a28c79. I seem to recall a crash in strcmp()
> in one log but I cannot be too sure.

Thank you for bisecting this.

The strcmp() crash is likely the issue. In
check_gpioint_resource(), we access agpio->resource_source.string_ptr
without checking whether it is NULL first:

    if (!strcmp(tmp->path, agpio->resource_source.string_ptr))
    ref->path = kstrdup(agpio->resource_source.string_ptr, ...)

The acpi_resource_source struct has a string_length field -- when it is
0, string_ptr will be NULL. On your machines, likely some GPIO resource
apparently has no resource source string, which we did not account for.

I am preparing a fix that skips GPIO resources with no resource source
string (string_length == 0 || string_ptr == NULL). I will test it on
my hardware first and send a patch shortly.

Sorry for the regression.

Thanks,
Hardik

On Wed, 3 Jun 2026 at 00:23, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Hardik,
>
> On Fri, May 29, 2026 at 03:38:37PM +0530, Hardik Prakash wrote:
> > I2C controllers may have child devices with GpioInt resources that
> > depend on GPIO controllers to be fully initialized. If the I2C
> > controller probes and enumerates children before the referenced GPIO
> > controller has completed probe, GPIO interrupts may not be properly
> > configured, leading to device failures.
> >
> > On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> > AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> > pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> > AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> > occur before the GPIO IRQ quirk in amd_gpio_probe() has run, causing:
> >
> >   i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost arbitration
> >
> > Add a generic dependency check in i2c-designware that walks ACPI child
> > devices, identifies any GpioInt resources, resolves the referenced GPIO
> > controllers, and defers probe if those controllers are not yet bound.
> >
> > This ensures GPIO controllers complete initialization (including IRQ
> > setup and quirks) before I2C child enumeration begins, fixing the race
> > without device-specific quirks or DMI matching.
> >
> > The probe ordering race was confirmed via dynamic debug tracing:
> >
> >   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
> >   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
> >   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
> >   2.348157  lost arbitration
> >
> > Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> > Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > Assisted-by: Claude:claude-sonnet-4-6
> > Assisted-by: GPT-Codex:gpt-5.2-codex
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202605240959.Kcf1lIg4-lkp@intel.com/
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494
>
> I bisected boot issues with a few of my test machines to this change in -next
> as commit ef76a3a28c79 ("i2c: designware: defer probe if child GpioInt
> controllers are not bound"). I consistently get no display output and I do not
> have serial access to these machines, so I do not have much to go on here at
> the moment. Occasionally, the network controller will be initialized so I can
> remote in but I have not been able to do it recently to try and gather logs.
> What information would be useful for trying to figure out what is going on
> here? I seem to recall a crash in strcmp() in one log but I cannot be too sure
> since it was late at night when I was doing my initial triage.
>
> # bad: [08484c504b55a98bd100527fbe10a3caf55ff3ff] Add linux-next specific files for 20260601
> # good: [e43ffb69e0438cddd72aaa30898b4dc446f664f8] Linux 7.1-rc6
> git bisect start '08484c504b55a98bd100527fbe10a3caf55ff3ff' 'e43ffb69e0438cddd72aaa30898b4dc446f664f8'
> # good: [57fb910db1b6051476b91a4d4ae18bc027a7f36d] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
> git bisect good 57fb910db1b6051476b91a4d4ae18bc027a7f36d
> # good: [18ea7e3ca91e7a9eb9e43c11154350cec160830b] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
> git bisect good 18ea7e3ca91e7a9eb9e43c11154350cec160830b
> # good: [a5696dd9c080352e25b576acf24450cef255b6eb] Merge branch 'tty-next' of https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
> git bisect good a5696dd9c080352e25b576acf24450cef255b6eb
> # good: [c158564f40f0d2a68833610ac136f9714fc51b16] Merge branch 'staging-next' of https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> git bisect good c158564f40f0d2a68833610ac136f9714fc51b16
> # bad: [4240c928a5edeb13fb3953248dfc45e5d9f42f00] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> git bisect bad 4240c928a5edeb13fb3953248dfc45e5d9f42f00
> # good: [2e24f5964b72ef213ecdb959a0b0d60b2dc00a3b] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
> git bisect good 2e24f5964b72ef213ecdb959a0b0d60b2dc00a3b
> # good: [6a350ccc4dc3f46ed2ee2592e3050956e415ef64] pinctrl: add new generic groups/function creation function for pinmux
> git bisect good 6a350ccc4dc3f46ed2ee2592e3050956e415ef64
> # good: [b12e12ee4138e30d786eda02223e87044c989bb1] gpiolib: Mark gpio_devt, gpiolib_initialized and gpio_stub_drv as __ro_after_init
> git bisect good b12e12ee4138e30d786eda02223e87044c989bb1
> # good: [446fa334d186316e76cbdc4e94e42af7d040a79c] pinctrl: qcom: Replace open coded eoi call with irq_chip_eoi_parent()
> git bisect good 446fa334d186316e76cbdc4e94e42af7d040a79c
> # good: [a8754838f83a9905af516f38dd2633744a94f71a] gpio: max77620: Unify usage of space and comma in platform_device_id array
> git bisect good a8754838f83a9905af516f38dd2633744a94f71a
> # bad: [ef76a3a28c79b628890431aa344af633e892035b] i2c: designware: defer probe if child GpioInt controllers are not bound
> git bisect bad ef76a3a28c79b628890431aa344af633e892035b
> # good: [b0c13ec17438577f90b379d448dfed1233e2c0a4] pinctrl: mcp23s08: Read spi-present-mask as u8 not u32
> git bisect good b0c13ec17438577f90b379d448dfed1233e2c0a4
> # good: [3f786abd23951f3f600a62fef42469d9200d5f52] Revert "pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7 14AGP11"
> git bisect good 3f786abd23951f3f600a62fef42469d9200d5f52
> # first bad commit: [ef76a3a28c79b628890431aa344af633e892035b] i2c: designware: defer probe if child GpioInt controllers are not bound
>
> --
> Cheers,
> Nathan

