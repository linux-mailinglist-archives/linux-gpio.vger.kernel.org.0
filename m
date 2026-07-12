Return-Path: <linux-gpio+bounces-39929-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uSMZFuq1U2pBeAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39929-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 17:42:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E34774539C
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 17:42:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cUr+5aKt;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39929-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39929-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F6E53009517
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 15:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D2B3403FC;
	Sun, 12 Jul 2026 15:42:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4776033F8BE
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 15:42:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870951; cv=pass; b=upg6vdqMDbzrEk7o+Y1TxIvvxLYwLWi0i1MJ6ZjkKfpNpzRN09LzMW7Aygp8oGQkV0ds62jIxuSa/F6nFTO3dRrprZJnjyS1D0PLTTB4TEAD49muGumslGQGFS/XPjoQpaHXToKdEsR50xT/mJO2RCNomAEyC3gnUNYy1Txs0so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870951; c=relaxed/simple;
	bh=gSc879GHO7OM65polMl8z6uADAnwPXUOGNB/VtrXRjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nm7adUeVqGViDectsb38CImnTWOjIYOVFEVudogqOadFRfyvlgtUjGF5XXyBDDcriQZ38r/zCYCSYvImXnaPzPPssI8Uhro5M4xRALB9cC4Peyq1/uNQNMgqOgL72BDexHDUsFPmTf2+PHbGzw0IXUtxyVz1+/Nu6yBjmqQdKUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUr+5aKt; arc=pass smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so30919905ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 08:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783870950; cv=none;
        d=google.com; s=arc-20260327;
        b=kGc8Ri1Zn3ZwTNbXWcWsc3rEao7JUB098u21T9R9EzVj4ZCDJJqI6p1aIWZhp1aITO
         zvb8eDZtAus+4IFwWNGvC5qZ8BBydOf0irpYCE3Zc5C30kSuSh/pSc8nISVuYWF3+rO4
         HXEo0YBJfJIqNvwpuWukrtfvrVBztmQ3D7WHTo3swG91riyNOhpL/2ns+PRAHdsz6Zks
         dCdIlzvhV16TLpZDfwoPhYf1XOgA5lSn7nGslp58Am4lG7qVB+TyL08hMKJOb6wYog6Y
         Bsh9lO5tH8L6ltu89R3+v/lue7YYK35AGOQhbn4UjIuA2/MSAb95EL4TjSFoBaW704dk
         DICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Wbo1q8mEUKrWsXK/f5GIgIPFSibN2PA5ipDDYRbQQeY=;
        fh=wBOEHwytJYUDI313eKM6htXbRq9LiIvIzz+7dw5lkII=;
        b=YS3FNmykSNqYCRWJ8u5S/QII2HVvzzrBFN0YG7nnSqY3oED+1lBa5MzzzlYoErRn5j
         xBj/7MSjBZoaZKTszTyN2E8RBDQLmt6vfCH3hT/bjbPWTNPz6cmCKV6/U32IsQKLk+pK
         dsmDL5omQtNGhS6xjlzBTAtwPfmrFiXiyXI0SI+GrfKYJdgwoV64qeMdzOdStSaPhG2T
         CcONYf1h4PBw7EKkO04lOpxtfggTL2E5XeUM0iYdb3GrHufHgR/8H5sj83aFi6iN8RqV
         Y+Gjl5evVaqsbKupXVRlXecTpEOjLNd9iRdhRfCWpcnUvnFFt+20qJAzJaAkT1ihhpZo
         imqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783870950; x=1784475750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wbo1q8mEUKrWsXK/f5GIgIPFSibN2PA5ipDDYRbQQeY=;
        b=cUr+5aKtwfW8UxLR3Nl4MNT7sLEw/E6Gw9OYI9Ph6lGw+MJbO8ghWMKEnPUiDwplca
         R9U986zCWFpNCmbAOmZPifBV0PdZATCI5ZEUpraoLmBjOEv8yCQTRj5BbnRJdrICMdRd
         rbJMt5OhZCcyda4jv48CIsYjN7eCk2yl+t+i8cgw5ckkk9wxbY9z376spcqRkgHlC9vN
         4/fWDdYhkTogYZbAjwfJV8eSxsqMavmKTn3uaPtwsV+hOUr3mD7Q2tpn97U4c2DeTtgi
         Tevkxeag8lmBJVm60jpjzpDZogB2wvRxM5uzdh5IlKpIeg4MPHutLmrcx5JMJ0vMFX0H
         ssHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870950; x=1784475750;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wbo1q8mEUKrWsXK/f5GIgIPFSibN2PA5ipDDYRbQQeY=;
        b=FnD4ojVVMkpsX89ISN3hb+SriOeFevKLh1WoX1TE57RBnDrSsqdnWrehRrIVc+9omy
         ucJSl12ONT2pkgxroD1ihEChvWVqM9SDLQVIu6lREm+l0Sr7ZKBil/7usH6pfOn5iQPh
         8jp70o1QDk8iyvbIpdhbf2YXDiHEBAjTVmxkD1qiBFQRrvAPMWVRaqDRBMS2MaV5rw6R
         KFJrNt7ehdNoBTzI3gI8+wjIosR+xjANjT1k+lp5uIwGzFa7mDhHdz0upZEtgWzYTlY6
         uCbKNZf1jit84gh6WS8NkwVtvqKTHE8Q2ZRUrGX9MTK2hnHog1wLAHACSw44EONiQ22H
         GkkQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+zOdpy8w1rsaqaPz9CPKyqJLm5ypkxy9MazOc47OyEVHEgX2E8djkx8Kmqu7gshHXfq6FpGzcIG5P@vger.kernel.org
X-Gm-Message-State: AOJu0YzBjTOepqt+mGa/KFN2eR5zGtytzD446/dxB0rGxiyv2dfXgE4h
	lL1LVxYFkx9EqS3NwXO604m1Lkfb+pwpEijxztNncy7o7SdSPBaZYENza6OGmV8sx/ra2guApLx
	d+OOaaBCcyxkLDmF0eZEoSooBmxT7dSA=
X-Gm-Gg: AfdE7cmUIm+39jSXCqPlOhri4LKifVCxDP8ioHLyjYUvWpEzSeFOEki9UBuDz8DKwRD
	wLRyTlU5CbRtS0bztbMVoK4G3hoHNDpDMmuKSD31OEY4tbvVRXgWODhJUcaiQz51qdNO+v/MQR1
	C15Ya7aR2tyULCwOAtixyNHK4F0DMLi8N+IZWCzAzQM8t0lIp8kfj6ZIoBFytr+DkfzaFFrJDR0
	ZeQT9skqIcfadvsAAP+ZiWrjYVMZJdC3yRKvCgaN9EtgRDKNx1CD+g6zO/3/DI8TesSNfoPjsrj
	8Ck+U+V6aGvJ2dZIuolrgy2QtvIUf08=
X-Received: by 2002:a17:903:28c:b0:2ca:6eca:492f with SMTP id
 d9443c01a7336-2ce9e9b9e78mr56293415ad.14.1783870949569; Sun, 12 Jul 2026
 08:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <27fb93d0e61704d495e3adf4ed614edac1642267.1782909323.git.mazziesaccount@gmail.com>
 <CAMRc=MccLRKb8ZjChcR7WK3TqV3=waSnKX=UX9LR=5hOT=_tsg@mail.gmail.com>
In-Reply-To: <CAMRc=MccLRKb8ZjChcR7WK3TqV3=waSnKX=UX9LR=5hOT=_tsg@mail.gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Sun, 12 Jul 2026 18:42:17 +0300
X-Gm-Features: AVVi8Cc6tt66W5dgLObqCo-hlb2IRsmOzx4mUkw5K5KParLVQP-uA6p1X9UaJlM
Message-ID: <CANhJrGM9ciyBfgGWBwOM3kNmcXGSq4QVM6a6Js+wtbr9ANtSJA@mail.gmail.com>
Subject: Re: [PATCH 7/8] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:matti.vaittinen@fi.rohmeurope.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39929-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mazziesaccount@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org,fi.rohmeurope.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E34774539C

pe 3.7.2026 klo 16.11 Bartosz Golaszewski (brgl@kernel.org) kirjoitti:
>
> On Wed, 1 Jul 2026 14:43:25 +0200, Matti Vaittinen
> <matti.vaittinen@linux.dev> said:
> > From: Matti Vaittinen <mazziesaccount@gmail.com>
> >
> > The ROHM BD73800 PMIC has 4 pins (named GPIO1, CLKOUT, FAULT_B and
> > EXTEN_OUT) which might have been set to operate as a GPI or GPO when OTP
> > (One Time Programmable memory) is written at device manufacturing.
> > Support the GPI/GPO use-case via GPIO framework.
> >
> > The default OTP for these pins is to not use any of them as GPI or GPO.
> > (The GPIO1 defaults as an ADC input regardless the naming). Hence the
> > driver assumes none of these pins is a GPI/GPO unless explicitly pointed
> > as GPI or GPO via device tree.
> >
> > Furthermore, pin's direction can't be changed after OTP configuration is
> > done. Also the default drive type for a GPO (CMOS / Open Drain) is set
> > by the OTP configuration. The BD73800 has a set of undocumented test
> > registers which should allow changing the drive type. Access to the test
> > register area or the test registers aren't documented and so this driver
> > does not support configuring the drive type even though it might be
> > doable.
> >
> > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > ---

Thanks for the review! I appreciate it!

> > +static int bd73800_gpio_get_pins(struct bd73800_gpio *g)
> > +{
> > +     static const char * const properties[] = {"rohm,pin-gpio1",
> > +             "rohm,pin-clkout", "rohm,pin-fault-b", "rohm,pin-exten"};
> > +     const char *val;
> > +     int i, ret;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(properties); i++) {
> > +             ret = fwnode_property_read_string(dev_fwnode(g->dev->parent),
>
> It would be cleaner with device_property_read_string(g->dev->parent, ...)

True.


> > +
> > +static int gpo_bd73800_probe(struct platform_device *pdev)
> > +{
> > +     struct bd73800_gpio *g;
>
> May I suggest a slightly more descriptive name for driver data? Maybe at the
> very least... "data"? :)

Ok.

> > +     struct device *parent, *dev;
> > +     int ret;
> > +
> > +     /*
> > +      * Bind devm lifetime to this platform device => use dev for devm.
> > +      * also the prints should originate from this device.
> > +      */
>
> Why would you need to comment on it though? It's very much the standard
> approach, isn't it?

Sure. I might have had this comment combined with the one below. Idea
has probably been to explain why we use both this device and the
parent. Can't bind lifetime to parent while needing it for regmap and
dt. Well, I agree that this device's comment is really not required.
I'll keep the comment about parent while removing this. Thanks.

> > +     dev = &pdev->dev;
> > +     /* The device-tree and regmap come from MFD => use parent for that */
> > +     parent = dev->parent;
> > +
> > +     g = devm_kzalloc(dev, sizeof(*g), GFP_KERNEL);
> > +     if (!g)
> > +             return -ENOMEM;
> > +
> > +     g->chip = bd73800gpio_chip;
> > +     g->chip.base = -1;
> > +     g->chip.parent = parent;
> > +     g->regmap = dev_get_regmap(parent, NULL);
> > +     g->dev = dev;
> > +
> > +     ret = bd73800_gpio_get_pins(g);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!g->num_pins) {
> > +             /*
> > +              * The BD73800 may or may not have pins allocated for GPIO
> > +              * depending on the OTP used at manufacturing. Free the memory
> > +              * and go out if there is no pins as then we have nothing to do
> > +              */
> > +             dev_dbg(dev, "no GPIO pins\n");
> > +             devm_kfree(dev, g);
>
> No need for that, because...
>
> > +             return 0;
>
> ... this will still leave a bound device in the system, I'm not sure we want
> it? The correct error code in this case is -ENODEV.

I am a bit uncertain. This isn't really an error. It should be very
much Ok to configure the support for PMICs with GPIOs to be compiled -
and also very much Ok to have a PMIC with no GPIOs. Returning an error
doesn't feel right. Furthermore, I am afraid that returning an error
might hurt the system start-up? Do you see some really problematic
consequences if we return Ok without registering the GPIOs. I'd assume
that wastes some bytes but I don't see other really severe
consequences.

As noted when sending - I am mostly offline during July so my replies
may arrive a bit late and next version is unlikely to be sent before
August.

Yours,
    -- Matti

-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

