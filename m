Return-Path: <linux-gpio+bounces-38169-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GW8rFzcAKGry6wIAu9opvQ
	(envelope-from <linux-gpio+bounces-38169-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 13:59:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C331A65FC34
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 13:59:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NS+lSTPA;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38169-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38169-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD5DF311FED8
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 11:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1033AF660;
	Tue,  9 Jun 2026 11:54:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D500404BD0
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 11:54:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006098; cv=pass; b=nYOQ2orPTUQ8o87iWAn2PN1zVh+cfi1KV75M1OHrZI9h/hZH//zT7o6qX3hYu0yImd4DD4kEpAOYB4Culvt2ID7ShVsSwhOzr8yxA88/SbtAHTC50J4zeStTq7DfQEc0bW7uQWwkzRVmzvXtuXf1LVEAZbiRNOc7ARoZnwr2j1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006098; c=relaxed/simple;
	bh=/8BY25L6laIZ5eAQmofWM5er4R77uuo2qY2VW0xgUmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0tnYMRXuLA+x/j3n215FwZXLMjt8G59DCrwUflKwlpLpOPqluYpk4YPwiBDSDHCNJMBx5MhfjiMyW+xNDSd47MQggF1D3fNMRTpaMLrH+DCgRLJVFr2hWKukVirFvPucUYg9G+OrkMvHXQ7gHGb7r5eeh/SfW7aqYMNtg7hjqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NS+lSTPA; arc=pass smtp.client-ip=209.85.128.180
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7f015f87fddso25284687b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 04:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781006093; cv=none;
        d=google.com; s=arc-20240605;
        b=WO0/emxUo/T4HVHW9rvfFIDLTX8tRjpGWvHqpGuweBGXC2GH58hmgxtgfMAVDCiLVB
         G91qvJWDzqHQq3ix4k8iGW5Hciz5wFPMvJV28LVxAQnr11N5EdcLXUiDOJHh+1OeoOVK
         TcbADgU1/DTkYrt9oVIyWXBRgC6/zyZnn5QRnDsgN5AIHqd4oy4n+EhQB7YByA/odzDk
         PF6SZrAGMJZp2lHWc1/+qrjsFJfKWeL1TxR2+L2rIvDe0gnMUJOEAuhWY3a0au/zwEWY
         PKxSElmOz+cszVcLACFHNp1R5wE5TfBah0u6ctnS6g4jk5IOF0zfGpkUGgN80xM4powL
         uXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XeQ+p77/d+Z7ZWKhcUmSiOA/AtiBMuey+b5sMyZaY/Q=;
        fh=KVir3zLdNMwx1MOEMOy1MbNdQcAXi+Xkd6pgiyCnNx4=;
        b=HMCA/qkAI2OCFkofbQxGvbNbm8j+KuKbsQBounxEHHqJ07q0HWfWGuGu2Zvg80ZGNb
         bpZx2F+/ao6RbD850Wy6e9kb1kA0nbbojWjd/hiJHqsgi2EiCGhuh6wZoFZKOPDRK95t
         jKe6bwFrIuNfZNWnGQdZ8WyMCa8XV3lcwAStKZqXsGVBwuLiwdFV3DkcdACjamG8PZHq
         o+Bp+TwxASRXa2wYxDhAfpaAmAJyRFGf+ud+i9HJ55LXKyRtmKiuEJz84b5UcBwUgwtQ
         CYFn+nFJFpK8URzFfvL+n+umMKVFDtjH1fbNNNjcIckOy/cD+EkYG8YOSaRwLra9Kxky
         2eoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781006093; x=1781610893; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XeQ+p77/d+Z7ZWKhcUmSiOA/AtiBMuey+b5sMyZaY/Q=;
        b=NS+lSTPAzUcrh+eVMOswdp9pHGCHaXR7HASZMoh+rroS1Dc9kU/J17lXL+ZpLzarRj
         QrD3Lgb3FMUovb/mQyPhFOvXAUi6yHGSUp51q5uhjXx57IIhbz1PP7LnV623N8IPfjl/
         iUQ7HWiSX0KWA5tfx05aqHDxpAcTgMSFztzGaRJwbHopIcmiVEFZyXuY8G71q1MIl+sW
         Y/KuGQqk9W3cMnSv1TCyftosO/EL1SuiLkKSqozmtgHzItyajc2QxpGQ87iNlnfdwFAc
         KdIPmYoH79MLUviFfxcZwAPEAUrBhYZMuROyEPS+0irEe7qJQ08n0o0YHkMAv9nCDl9r
         Mqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781006093; x=1781610893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeQ+p77/d+Z7ZWKhcUmSiOA/AtiBMuey+b5sMyZaY/Q=;
        b=ZBJO7OKzPNInHzsAexNLjDb5Y5gW8AVhxy4B2FXLyRoFP15EmGtU63K2DPZyPhEa/x
         3YaOB/TIlTu3i2rB9CtHlXe8ZlAq+HVWQlExPp7HTxX0dgT6aBPRIiG8wWd3W3Dh0G1g
         d4QeLC900tozYwIOcYaFdkOcvBLkzvzPeOJONDg/Ooar4OC77PibndqyKFGwcvt57q51
         z7tZrlWzj+tJynWnrPeOeTyb0/BPKQkX/rafciK4Y4R0kSm5SGS8fm1k5APDzegA/+fb
         NiqUnQAKzxgaq3Yc0q0QoUB5KGlx5Cc96c8L2k6GzHtJunWZHlKeobM3dGp6VyOuy1SC
         O0lQ==
X-Forwarded-Encrypted: i=1; AFNElJ89t2g4NKceXn6NsyG71/oJAxGpZIWTBqEfrPYk4eqfPPKtUnHlOF1zi6or6xQJrQn5vXbJTm3TXqEY@vger.kernel.org
X-Gm-Message-State: AOJu0YwFx8lVOoZoMUue8h3Dpk1dVctPoAin8VYO0rrVoEt8gvzJMF+e
	xGgLd4AQ+uejGHt9MKnViRzsaYYTgwdnvc8s1DR8HMQfAHgjmTLWLkTXarQaeeHSdkyVZ5JhGE1
	FP5BRemmkeoZl933f+vn/nIaCNUkdmUs=
X-Gm-Gg: Acq92OFgOH+oPmyQvZyiBB8b5OruCO9gsCE2LbEs2URBS2A3GmC5TrZxQOKwl13GJ8X
	zKj0VLr3JwmmPP0y66qxc7QCrt2ngxuECr+Xn2JJDVdONMWRnuc5pPMziiQbM0oYch0CKWx50l3
	0SIE/JrcrW1dW1taZ8A28waEJqZBvt7Oy6djPcQZSqfygLkvm9zs6L/oXbnVsqXCT8yMpjIPeXB
	LtDkhzkoXIiZW9uC3xHwXPEDSJBB+MCMwrSc6A4nUQc521uApPmPa1TzGn3W0wAJ+92w41mxj3F
	BxJ12iupTJIrnl2SVNIPePbn93CFYL9BIgs4/PENkDish36Jrr3WaXV0Sqy/Idtr2GCNtNC1ohx
	KnmGVhlCMU2Yz39u3N+9RNGYpYrzeyfjtR9U=
X-Received: by 2002:a05:690c:c641:b0:7ef:9fd9:db07 with SMTP id
 00721157ae682-7ef9fd9ec08mr68513147b3.12.1781006092646; Tue, 09 Jun 2026
 04:54:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com> <90656be5-eca0-4a09-9b19-0c6e85f1d455@intel.com>
In-Reply-To: <90656be5-eca0-4a09-9b19-0c6e85f1d455@intel.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Tue, 9 Jun 2026 17:24:40 +0530
X-Gm-Features: AVVi8CdfZUz24SRju8INwnmTSUkgRXl7HmToTY6fmuk1j_i-qHGGLW828h7ZG9M
Message-ID: <CANTFpSV7N=5U9yuXcU-D=PDpwj=kD__JU89UGL1HQOYiaL77qg@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	andriy.shevchenko@intel.com, mario.limonciello@amd.com, brgl@bgdev.pl, 
	basavaraj.natikar@amd.com, linusw@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, kernel test robot <lkp@intel.com>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, ravitejax.veesam@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38169-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:chaitanya.kumar.borah@intel.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:superm1@kernel.org,m:lkp@intel.com,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:ravitejax.veesam@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C331A65FC34

On Mon, Jun 08, 2026 at 16:18, Borah, Chaitanya Kumar wrote:
> This patch seems to cause a regression in our CI. Few of the machines
> are unable to boot to ssh console and therefore hindering our test
> execution. Bisect points to this patch and reverting this patch seems
> to fix the issue.

Thank you for the report and the log. The putty log shows the kernel
panic: "Timeout: Not all CPUs entered broadcast exception handler"
after what appears to be a probe deferral loop causing CPU starvation.

Andy Shevchenko already identified code issues with this patch on June
3rd and requested Linus Walleij drop it from his tree. The patch has
not been fixed yet -- it needs a proper rewrite addressing NULL pointer
dereferences and error path issues before it is safe to apply.

Linus, could you please drop commit ef76a3a28c79 from your fixes tree?
The regression affects multiple machines including Intel CI and Nathan
Chancellor's test systems.

I will send a corrected version once the rewrite is complete.

Sorry for the disruption.

Thanks,
Hardik

On Tue, 9 Jun 2026 at 16:18, Borah, Chaitanya Kumar
<chaitanya.kumar.borah@intel.com> wrote:
>
> Hello Hardik,
>
> On 5/29/2026 3:38 PM, Hardik Prakash wrote:
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
> >    i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost arbitration
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
> >    0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
> >    0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
> >    0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
> >    2.348157  lost arbitration
> >
>
> This patch seems to cause a regression in our CI [1]. Few of the machine
> are unable to boot to ssh console and therefore hindering our test exection.
>
> The issue first appeared with next-20260601 [2].
>
> Bisect points to this patch and reverting this patch seems to fix the issue.
>
> Putty logs are attached.
>
> Could you please check why the patch causes this regression and provide
> a fix if necessary?
>
> ==
> Chaitanya
>
> [1] https://intel-gfx-ci.01.org/tree/linux-next/combined-alt.html?
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260601
>
> > Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> > Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > Assisted-by: Claude:claude-sonnet-4-6
> > Assisted-by: GPT-Codex:gpt-5.2-codex
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202605240959.Kcf1lIg4-lkp@intel.com/
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494
> > ---
> >   drivers/i2c/busses/i2c-designware-platdrv.c | 156 ++++++++++++++++++++
> >   1 file changed, 156 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> > index 3351c4a9ef11..1c01b0460385 100644
> > --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> > +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> > @@ -8,6 +8,8 @@
> >    * Copyright (C) 2007 MontaVista Software Inc.
> >    * Copyright (C) 2009 Provigent Ltd.
> >    */
> > +
> > +#include <linux/acpi.h>
> >   #include <linux/clk-provider.h>
> >   #include <linux/clk.h>
> >   #include <linux/delay.h>
> > @@ -130,6 +132,152 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
> >       return 0;
> >   }
> >
> > +#ifdef CONFIG_ACPI
> > +struct gpio_dep_ctx {
> > +     struct list_head gpio_controllers;
> > +     int ret;
> > +};
> > +
> > +struct gpio_controller_ref {
> > +     struct list_head node;
> > +     char *path;
> > +};
> > +
> > +static int check_gpioint_resource(struct acpi_resource *ares, void *data)
> > +{
> > +     struct gpio_dep_ctx *ctx = data;
> > +     struct acpi_resource_gpio *agpio;
> > +     struct gpio_controller_ref *ref, *tmp;
> > +     bool found = false;
> > +
> > +     if (ares->type != ACPI_RESOURCE_TYPE_GPIO)
> > +             return 1;
> > +
> > +     agpio = &ares->data.gpio;
> > +     if (agpio->connection_type != ACPI_RESOURCE_GPIO_TYPE_INT)
> > +             return 1;
> > +
> > +     /* Check if we've already tracked this GPIO controller */
> > +     list_for_each_entry(tmp, &ctx->gpio_controllers, node) {
> > +             if (!strcmp(tmp->path, agpio->resource_source.string_ptr)) {
> > +                     found = true;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (!found) {
> > +             ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> > +             if (!ref) {
> > +                     ctx->ret = -ENOMEM;
> > +                     return 0;
> > +             }
> > +
> > +             ref->path = kstrdup(agpio->resource_source.string_ptr, GFP_KERNEL);
> > +             if (!ref->path) {
> > +                     kfree(ref);
> > +                     ctx->ret = -ENOMEM;
> > +                     return 0;
> > +             }
> > +
> > +             list_add_tail(&ref->node, &ctx->gpio_controllers);
> > +     }
> > +
> > +     return 1;
> > +}
> > +
> > +static int check_child_gpioint(struct acpi_device *adev, void *data)
> > +{
> > +     struct gpio_dep_ctx *ctx = data;
> > +     struct list_head res_list;
> > +
> > +     INIT_LIST_HEAD(&res_list);
> > +
> > +     acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, ctx);
> > +     acpi_dev_free_resource_list(&res_list);
> > +
> > +     if (ctx->ret < 0)
> > +             return ctx->ret;
> > +
> > +     return 0;
> > +}
> > +
> > +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> > +{
> > +     struct acpi_device *adev = ACPI_COMPANION(dev);
> > +     struct gpio_dep_ctx ctx = { .ret = 0 };
> > +     struct gpio_controller_ref *ref, *tmp;
> > +     int ret = 0;
> > +
> > +     if (!adev)
> > +             return 0;
> > +
> > +     INIT_LIST_HEAD(&ctx.gpio_controllers);
> > +
> > +     /* Walk all child devices and collect GpioInt controller references */
> > +     ret = acpi_dev_for_each_child(adev, check_child_gpioint, &ctx);
> > +     if (ret < 0 || ctx.ret < 0) {
> > +             ret = ctx.ret ?: ret;
> > +             goto cleanup;
> > +     }
> > +
> > +     /* For each GPIO controller, check if its parent device is bound */
> > +     list_for_each_entry(ref, &ctx.gpio_controllers, node) {
> > +             acpi_handle handle;
> > +             acpi_status status;
> > +             struct acpi_device *gpio_adev;
> > +             struct device *gpio_dev;
> > +             bool bound;
> > +
> > +             status = acpi_get_handle(NULL, ref->path, &handle);
> > +             if (ACPI_FAILURE(status))
> > +                     continue;
> > +
> > +             gpio_adev = acpi_fetch_acpi_dev(handle);
> > +             if (!gpio_adev)
> > +                     continue;
> > +
> > +             gpio_dev = acpi_get_first_physical_node(gpio_adev);
> > +             acpi_dev_put(gpio_adev);
> > +
> > +             if (!gpio_dev) {
> > +                     ret = -EPROBE_DEFER;
> > +                     goto cleanup;
> > +             }
> > +
> > +             /*
> > +              * Check if the GPIO controller's device is bound. If not,
> > +              * defer probe to ensure GPIO initialization (including IRQ
> > +              * setup and quirks) is complete before we enumerate I2C
> > +              * child devices.
> > +              */
> > +             scoped_guard(device, gpio_dev) {
> > +                     bound = device_is_bound(gpio_dev);
> > +             }
> > +             if (!bound) {
> > +                     put_device(gpio_dev);
> > +                     ret = -EPROBE_DEFER;
> > +                     goto cleanup;
> > +             }
> > +
> > +             put_device(gpio_dev);
> > +     }
> > +
> > +cleanup:
> > +     list_for_each_entry_safe(ref, tmp, &ctx.gpio_controllers, node) {
> > +             list_del(&ref->node);
> > +             kfree(ref->path);
> > +             kfree(ref);
> > +     }
> > +
> > +     return ret;
> > +}
> > +#else
> > +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> > +{
> > +     return 0;
> > +}
> > +#endif /* CONFIG_ACPI */
> > +
> >   static int dw_i2c_plat_probe(struct platform_device *pdev)
> >   {
> >       u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > @@ -138,6 +286,14 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
> >       struct dw_i2c_dev *dev;
> >       int irq, ret;
> >
> > +     /*
> > +      * Check if any child devices have GpioInt resources, and if so,
> > +      * defer probe until those GPIO controllers are fully bound.
> > +      */
> > +     ret = i2c_dw_check_gpio_dependencies(device);
> > +     if (ret)
> > +             return ret;
> > +
> >       irq = platform_get_irq_optional(pdev, 0);
> >       if (irq == -ENXIO)
> >               flags |= ACCESS_POLLING;

