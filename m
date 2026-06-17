Return-Path: <linux-gpio+bounces-38648-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FW7lKRn0Mmoh8AUAu9opvQ
	(envelope-from <linux-gpio+bounces-38648-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 21:23:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0182A69C25F
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 21:23:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AqlsYcqz;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38648-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38648-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B8C8301ECC8
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 19:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBF833BBA7;
	Wed, 17 Jun 2026 19:23:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D07231077A
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 19:23:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781724182; cv=pass; b=nCcawumPe36G1dscUprkVuYWKDrWr0yHju9M+s+WQpabkGUVlcWM7QkeufU5Hp/w3CNU3xIIA9Lp/peMTU26li4HHCv1h3Kb1jRW3ezweTx+YQOGsGOuXWWWEQCTCkMRY9ZPWMzegl0lMZpgVAm7rxMflwc5aHkeN691Oj41yno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781724182; c=relaxed/simple;
	bh=kkdL8pb5EYmv26GllFDBQ07biypjdEituDlXNPeSrpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFv0Kilydn81+bifElqETtYGN18oRpA9wErEoRDtgI8lH5BEODs6qI5qbttWvQXf3wwm2CsUilKem6AGZqQMSlmZcJ3siyrv4dl3SDoS00K5sre6OkL1+jmcRzWEoQRcI1y6g6pWjXblyCCW8j39dvTLqZ54SKclev+2VzCr8Ic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqlsYcqz; arc=pass smtp.client-ip=209.85.128.181
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7e2fc11088dso2459547b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 12:23:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781724179; cv=none;
        d=google.com; s=arc-20240605;
        b=K9eaMaaP+LCobE+bDC5VTvb9eUEGq87bKyZwDRVt9AW8CAQpliA5epVwyXx2FxsLu4
         mYMyoDNC0QOSQb0dXi4MCDHYXaX90WpZNMO+uuL9mx5E8M655ThIWZLxi60Iv97SxHaJ
         8m0OdMmLD92DSgZMjSZMWLPtUSWFDsQOC4uizjsTrtklCcAUuYFMzCPoQfuMlAqJZWb/
         jtK/aY+gabvP6NhexiLEjlHsAC2dJyRIVzZsWaHBhh6abYhWGLgeDKDUPjk6CVl7mlfL
         IEHAUZIkbzJn4ur/4PcvBuRGSCOiwSWJSW7DhWwAG7W/Lb78gfapwvF3xa16xnfkPDdS
         eu3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qCYjocoLg3CrCDEI/FISPfSrPPe+uK1kIVJZnXGGH+8=;
        fh=1P+C/pPYorEwxYETz9cnfbyHsTqZiErddQtUcuN0BVQ=;
        b=TuYocZOeDiNYqchHX9xv2/sVXjh8o9qfDdk858vesc0+1LiAkNq4XXPaSBvcoCSLiO
         81eAwJuKsTDeOkhnvF+03s7b0qTBc0FDHntM+w4gCgV2N3BDRQZKluSjoq0YybacjDis
         yJBAu8F8+DXi80JiYfkTKTn1FwpoIBx3ZSPgowq3VIqQs60sBoFUnM0wtcCovX6lyB5N
         Dhl+Q0VhNU//S+ld68Jlbd0rTz6ZXgf1LpFc/ZEsm+ljoODbExly8up4Aqr+mYJ8/yyJ
         UIIDaPUp+NYdNzqSFAlL1l+Q1eKnrE5m0t3RiXAnwhItp7bqWHt55QvEDchO4VGlHaQs
         OSZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781724179; x=1782328979; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qCYjocoLg3CrCDEI/FISPfSrPPe+uK1kIVJZnXGGH+8=;
        b=AqlsYcqzLP4SxskCR9DxcqMI9jL+8IbdkuWcMbMjiFE71Zczd1gjIa7OxA21dqgZBu
         SqxzNLe+QemKO7uby3nkYdT2Q/Q1TeITGHxgWQvH1FGvGNwIrHWIv4hYvd5NfQxXIQrL
         4w2cq1J1FSQHzNtaPFlMo24Q32bUSembfwOtdNt2KSbCUqnQB8OrCbjRtNFLvxNaNK0V
         z12E2qRxuTv2DEbp9gv+5dLHjE7zssIZSTWRC4WYNXRklPjMmfZPRVu6xnRxN/cbq1Oc
         6hdNlw7G59hDF0i0fXmxwRTrgUI0aTUp12c4SD5aJdF1no32iTOVba9BLxTS2M179Ih4
         GCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781724179; x=1782328979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCYjocoLg3CrCDEI/FISPfSrPPe+uK1kIVJZnXGGH+8=;
        b=P1QfjzfbK/U+FY5mWEaZcoOaLjkDQokM79EWT2obEfP21DReWzudIi8Jrx4hlriBe3
         Ae+jX6YwJb8Dg4DJ8vZZknBXt+tvbccDoTYiG6HhnwuA9EKmm7Zv5in3GvrxHglILpqB
         ARmFHdMN6IO+L/wTOhK/WNHlM7NJqB3ZXXYqipvhF3dvfClmInbiRgMrmQTKH4hfEmYT
         8SQQFrbYb9c6fBtUpvHGujWAOpsZ9x6PRrdNyxxpDRAlzzwfSjYHRKRrHoAiiTW4Ph9M
         C869/67rXJocp38PG2JrLufEnCnAGrxa//Rmsh9RdJFR/aQqpttBr+e/NPBsi0s8qlFu
         AN/A==
X-Forwarded-Encrypted: i=1; AFNElJ+/1X1GAEGv/ef7f5CglQipGw9Q8nCN0N0f7P9HuriSasmn8Ersu5M0i4V3N0bnWKZlqnUxw4N6DO86@vger.kernel.org
X-Gm-Message-State: AOJu0YyrP+SgKYS03Z/8DwjjvqHxRv8LkAoQvn4D4pOPO3SzL8dLxvOU
	zmo1sWS3N9gzIVqLa7HkzswUddWrCuUrMJ45u8vlfhGeqvyjY2zHLwa+Iy413wr0o0NUN8sIIoM
	zZYeMLx6adNRxMqeBEQhWH4R9vPjbPrY=
X-Gm-Gg: AfdE7ckCIiKa21vp0koGVDtt8liTURMzVZEYoR4RURtzsvi2NflZhMiKxWdDy7JO7/T
	a3uQC6BrWhzP1rbc9iy/CNh2xHiF1w9ji9DjW0FO3+pH6bJckXVi04bo6RE7ajSQswRg5PXKeDI
	1/h6V1rqjxNsUwrfH85bsYHtrfUPjZ0wnzpw/DR96m5uurhuZOPPWxh1ayyAWVDQvJZC8z0bGxf
	PR4+57SaU45p7LbEAUBPRir6D7rYedz8uOiVjWLbNMS9WDoddRVtH2ucVB427KyQHAnAQ0XC/h5
	XALjkE5FJN6t/nZyPWmsxf4YUk9bbH54OnYJGi+YRtfVmxrhzJ5q51IRDud4Abdu7+kwiAd4ctX
	lKPh3m0EEYJCpZUkBqpp244LVVgKX4S6KCkiq5nZuwD4Jv9xqu0c88vq3lQ==
X-Received: by 2002:a05:690c:15:b0:7ff:1a06:472 with SMTP id
 00721157ae682-7ffc504f31amr3633587b3.4.1781724179369; Wed, 17 Jun 2026
 12:22:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617065922.26004-1-hardikprakash.official@gmail.com>
 <20260617065922.26004-3-hardikprakash.official@gmail.com> <ajJobvY67HKufaTs@ashevche-desk.local>
In-Reply-To: <ajJobvY67HKufaTs@ashevche-desk.local>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Thu, 18 Jun 2026 00:52:46 +0530
X-Gm-Features: AVVi8CdEl_6za-R-STzgXEeecIrtTkqRjlP_oenlQE43jm7-diiS5o2-ORNN9WQ
Message-ID: <CANTFpSUSKwTj-z0E2w3C_8ue8wANE+dHtDKboZ1+rqwN98C3cA@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linusw@kernel.org, nathan@kernel.org, chaitanya.kumar.borah@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38648-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0182A69C25F

On Wed, Jun 17, 2026 at 14:57, Andy Shevchenko wrote:
> > +     if (!agpio->resource_source.string_length ||
> > +         !agpio->resource_source.string_ptr)
> > +             return 1;
>
> I'm wondering if we simply can move to strncmp() instead of this check
>
> > +     list_for_each_entry(ref, gpio_controllers, node) {
> > +             if (!strcmp(ref->path, agpio->resource_source.string_ptr))
>
>                 if (!strncmp(ref->path, agpio->resource_source.string_ptr))

Could you clarify? strncmp() with n=string_length would protect the
dedup check against a NULL or unterminated string_ptr, but we still
need string_ptr to be non-NULL before passing it to kstrdup(). Should
we keep a NULL/zero-length guard before kstrdup() and only replace the
strcmp() in the dedup loop with strncmp()?

Thanks,
Hardik

On Wed, 17 Jun 2026 at 14:57, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Jun 17, 2026 at 12:29:22PM +0530, Hardik Prakash wrote:
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
> > fail with lost arbitration errors.
> >
> > Add a generic dependency check in i2c-designware that walks ACPI child
> > devices, identifies any GpioInt resources, resolves the referenced GPIO
> > controllers, and defers probe if those controllers are not yet bound.
> > Uses acpi_gpio_get_irq_resource() to avoid duplicating GPIO resource
> > parsing logic from gpiolib-acpi. Skips resources with no resource
> > source string (string_length == 0 or string_ptr == NULL) to avoid
> > crashes on hardware where GPIO resources have no named controller.
> >
> > The probe ordering race was confirmed via dynamic debug tracing:
> >
> >   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
> >   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
> >   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
> >   2.348157  lost arbitration
>
> ...
>
> > +static int check_gpioint_resource(struct acpi_resource *ares, void *data)
> > +{
> > +     struct list_head *gpio_controllers = data;
> > +     struct acpi_resource_gpio *agpio;
> > +     struct gpio_controller_ref *ref;
> > +
> > +     if (!acpi_gpio_get_irq_resource(ares, &agpio))
> > +             return 1;
>
> > +     if (!agpio->resource_source.string_length ||
> > +         !agpio->resource_source.string_ptr)
> > +             return 1;
>
> I'm wondering if we simply can move to strncmp() instead of this check
>
> > +     /* Skip if we've already tracked this GPIO controller */
> > +     list_for_each_entry(ref, gpio_controllers, node) {
> > +             if (!strcmp(ref->path, agpio->resource_source.string_ptr))
>
>                 if (!strncmp(ref->path, agpio->resource_source.string_ptr))
>
>
> > +                     return 1;
> > +     }
> > +
> > +     ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> > +     if (!ref)
> > +             return -ENOMEM;
> > +
> > +     ref->path = kstrdup(agpio->resource_source.string_ptr, GFP_KERNEL);
> > +     if (!ref->path) {
> > +             kfree(ref);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     list_add_tail(&ref->node, gpio_controllers);
> > +     return 1;
> > +}
> > +
> > +static int check_child_gpioint(struct acpi_device *adev, void *data)
> > +{
> > +     struct list_head res_list;
> > +     int ret;
> > +
> > +     INIT_LIST_HEAD(&res_list);
>
> > +     ret = acpi_dev_get_resources(adev, &res_list,
> > +                                  check_gpioint_resource, data);
>
> Make it a single line.
>
> > +     acpi_dev_free_resource_list(&res_list);
>
> It's not critical double free (it will try to free an empty list) on error.
>
> > +     return ret < 0 ? ret : 0;
>
>         ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, data);
>         if (ret < 0)
>                 return ret;
>
>         acpi_dev_free_resource_list(&res_list);
>         return 0;
>
> > +}
> > +
> > +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> > +{
> > +     struct acpi_device *adev;
> > +     LIST_HEAD(gpio_controllers);
> > +     struct gpio_controller_ref *ref;
>
> Reversed xmas tree order.
>
> > +     int ret = 0;
>
> Useless assignment.
>
> > +     adev = ACPI_COMPANION(dev);
> > +     if (!adev)
> > +             return 0;
> > +
> > +     /* Walk all child devices and collect GpioInt controller references */
>
> > +     ret = acpi_dev_for_each_child(adev, check_child_gpioint,
> > +                                   &gpio_controllers);
>
> Make it a single line.
>
> > +     if (ret < 0)
> > +             goto cleanup;
> > +
> > +     /* For each GPIO controller, check if its platform device is bound */
> > +     list_for_each_entry(ref, &gpio_controllers, node) {
> > +             acpi_handle handle;
> > +             acpi_status status;
> > +             struct acpi_device *gpio_adev;
> > +             struct device *gpio_dev;
>
> Reversed xmas tree order.
>
> > +             bool bound;
> > +
> > +             status = acpi_get_handle(NULL, ref->path, &handle);
> > +             if (ACPI_FAILURE(status))
> > +                     continue;
> > +
> > +             gpio_adev = acpi_fetch_acpi_dev(handle);
> > +             if (!gpio_adev)
> > +                     continue;
>
> > +             gpio_dev = acpi_get_first_physical_node(gpio_adev);
> > +             acpi_dev_put(gpio_adev);
> > +             if (!gpio_dev) {
> > +                     ret = -EPROBE_DEFER;
> > +                     goto cleanup;
> > +             }
>
> > +             /*
> > +              * Defer probe until the GPIO controller is fully bound,
> > +              * ensuring its IRQ setup is complete before we enumerate
> > +              * I2C child devices.
> > +              */
> > +             scoped_guard(device, gpio_dev)
> > +                     bound = device_is_bound(gpio_dev);
>
> > +             if (!bound) {
>
> Some of the compilers might complain the use of uninitialised variable (they
> might not parse properly scoped_guard() case).
>
> > +                     ret = -EPROBE_DEFER;
> > +                     goto cleanup;
> > +             }
>
> To make it sure and deduplicate above the whole stuff can be written as
>
>                 gpio_dev = acpi_get_first_physical_node(gpio_adev);
>                 acpi_dev_put(gpio_adev);
>                 if (gpio_dev) {
>                         guard(device)(gpio_dev);
>
>                         bound = device_is_bound(gpio_dev);
>                 } else {
>                         bound = false;
>                 }
>                 /*
>                  * Defer probe until the GPIO controller is fully bound,
>                  * ensuring its IRQ setup is complete before we enumerate
>                  * I2C child devices.
>                  */
>                 if (!bound) {
>                         ret = -EPROBE_DEFER;
>                         goto cleanup;
>                 }
>
> > +     }
> > +
> > +cleanup:
> > +     free_gpio_controller_list(&gpio_controllers);
> > +     return ret;
> > +}
> > +#else
> > +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> > +{
> > +     return 0;
> > +}
> > +#endif /* CONFIG_ACPI && CONFIG_GPIOLIB */
>
> I'm not sure if it's good to have all this quirk here or simply start
> a i2c-designware-quirks.c. Theoretically the PCI counterpart might,
> but I think quite unlikely, want to have something similar in the future.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

