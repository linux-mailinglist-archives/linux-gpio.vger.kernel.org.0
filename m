Return-Path: <linux-gpio+bounces-36958-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C46IA3IB2oYIgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36958-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 03:27:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E293C559C61
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 03:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21B6D301B710
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 01:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958C42222A9;
	Sat, 16 May 2026 01:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWcbzqZd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A657E0E8
	for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 01:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778894857; cv=pass; b=QAcno7fQcQZGOHRpKYBauvGoWEalhUXbMnTRq5IWW9jNmNC/j1dJizbveQqQnMPXQNrt0UOhbQoTZT7j4351UL8n593iLbIZetU+m9PwH7ZiifScYfk9JR5X5W8cYwW5ZkKrhe29xGm0ExLDRUI9OqAQ/lPJEMk2Vxxlf7dGqnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778894857; c=relaxed/simple;
	bh=bW7QzCTqcRsx/T9yD6fdRoLOs7bmToMIW9FFX1/ogbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7b6exU15DEi+DVuDXK0XexC6HL3K8mzDOiq4Sdb21SiDvJfZc7VJR7dEAsomxU/kLX0Ol2SVHoiXw0Y9+yHAfx+RXG0cJCeyoWkepJ/7f66ii76nevGry/OcPJ6pKym84j6ZqbSn/Hsagl3Ns5zwwMjZumZOgKcTLO7AuRnRe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWcbzqZd; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-65c6a2158d3so543444d50.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 18:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778894855; cv=none;
        d=google.com; s=arc-20240605;
        b=RH1AkawW3NDlyGdfw9hte53LX4nJ+9cWUYt8mXMYFbKf0U3eLozHwEeYXhPsL5b8Ow
         qSVbpkfbj9WWzR49rvz6FaWzFy/ZsPj7g27erg0bXZRbZFl4/UQOpTzkC9v5jnbafy3U
         iMF+zMon5Iap0MdPVWV3zS44we4NLOTCFXFT/v9qGXtu/l/LnYssIOSCN0hlwZbRhbLL
         BTUvjhrOUn904wVyZ0OzbiWGzci38nMn8TjFwpf50Ca78udNaKp1IEdWT1RMkEmKymPm
         kSwaXst+l2/LIo8/naQlVmFvi/VoZJT5bKjJZ3q+CVb0MT4Yecckt8OCIMGZSeToEN3U
         p0jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L9FZebPfxjmKa8vSCx4bP2RNfwPyM+VKakDWUr1Bhyk=;
        fh=2QLSbdOsUYuSwYBcHMO6no5EFKdgkb2kQhgSYnb+B/I=;
        b=JVw3YtKd+aGkzw9Af0Mgzhw51N/7LIznpn7eQh7lfXMs8kFZAY90Ue6mi5syIBHcGv
         YVGibPNAD9cLegDJ2W+m+cibsb6pyv/U6csh704WfIEaYL3GWR6LmSi5aO9PGM56BXPw
         qMctEGsNKI+AfqdkxWva+6Z0JlcP5Y1LxkxYHdJ7fHiSi4CFIvb8tAlc47tjKc4ug30u
         LN7Wc0V0dtSYle6yObFrfii1xfnS5Qh/gPZ8Ik4r7AY7/MEam9REaXlgHW73ZFBIZBIW
         EfDCBYpjwN4smXKWufAw6OA4+YVgQ1SVGq9juoSp2L4nKj5NeVTk28mbCib/7dVCqe0s
         iGeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778894855; x=1779499655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9FZebPfxjmKa8vSCx4bP2RNfwPyM+VKakDWUr1Bhyk=;
        b=LWcbzqZd/ovl4FjDDMeathj9xRY2PX2MuSg5fhkGp9BjmSiVp6ReTrHPqdsIeuyWNF
         ZZwU+n/icY/by9OZY6l7VnzDEexmXz3IusKOPtyMTPMC4UAQIKDSIowBbT5CLr+5xsrO
         +yN6vYzuLCnMpgnhuR47reycdF9IrfOQ28P6wor5jFZhccyu67Sb1ZR8GpAa0Sm6pXvL
         WAfUQ3mXegfD4mXHhXaiRpxVScLSQPVKaSgsC2wNTPsZM+QmC3nflT7xRWUYmdA1Ixk1
         bfalYICFv/315dhs1sK4yh7oaylMEH46OV6r4Bhro7fDzMWcewJb8nI4AOYhVpuy1o3V
         d63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778894855; x=1779499655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L9FZebPfxjmKa8vSCx4bP2RNfwPyM+VKakDWUr1Bhyk=;
        b=TYJ54PvFvtTzWDqX3p1KrYCaY366pCl4yVIz/pearwX11QP7ggHzszD5ZfP0dm4XWx
         pt+kozd4Fsz4Y/WddIOMpERjN8JNZm/hf4qQp2ayodoOHLcv74vvMW/hgcR1JRD+FVB0
         kt3Gh26Te3tTxdlLWfQlauksyZo/AcZNH3ndF9WH2xIxkaOigIUDmO7om3WXh0P2ObHQ
         LUsOVMCuGwaGIbNESsiVCIlpcNpzuVi4F3BLwVQMITnj7qpE14SoQ+7bopQ0CJ6DuhEz
         cG+f8swkGm5qZgXjCGHvsCfK4rgpG2v+hTTgmQgNqdqx5cJA7sKZVR47WB3jI0WTAOt8
         FBuw==
X-Forwarded-Encrypted: i=1; AFNElJ95oFXqS1eE+Gwz7YLeS+CvUvwUi+gDpvipXoAdhAdwUy2uIiICx+iqWI1Olqko+IbxFiegxUrQIoJG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx5mPLn8A/RGfbH3opEf3qzzMQ99Xi851hCD4bXE76FERYQyfo
	vMK6bCgcMbLf7Te4ALkenbTmqszJykLHJS32NCInbC+FbX6WRlqI4JZQ/WsG0Dbhu3P4gBpLfJy
	6C9v7rNjskKp6Th4DZiPOf0siGOIn0gg=
X-Gm-Gg: Acq92OHyg750qqn9Y/shFaxCPa32RMXhakqjoOGM0HF0CzjGl74BTWg9Gbxal+/Z4oM
	8IbeESpLZwsU0YOnVjJ67gTKTMzFMoJ0X9GvdBflSe6MGV8xTywOS9FoDSPMWmi0Y5+UnQm/evz
	Rmi1WrpYxVS2IafBkm7Hnn+qJ9ZgKlhuBbSxhpM/jQg2E7BfLznV+ZGnIS514Y+cjslTIvOWfab
	ejwrmSfE2U+dOxI3fX5eqhN5Ga55vSJI3OeqcskkA8CC1eflVvkVTcYpWp/m73b3Bl5C4xGlMoO
	Wx5lJp4w/S+0AgVQfVVhuTrQnJIMfc0XJFfXUevB/EDuy8JrCJ8p0lw4V3A3RQfCe6b3H9WWgNR
	+ebiRzWL39aIVp4DLcK7Ew11/AjrIWfkhNbTjnjSbzzHTuhRc9xa5ssXd/xQ=
X-Received: by 2002:a53:c05b:0:10b0:65d:5702:3373 with SMTP id
 956f58d0204a3-65e228469f1mr5969955d50.33.1778894854916; Fri, 15 May 2026
 18:27:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515161516.10474-1-hardikprakash.official@gmail.com> <32e96be9-a987-4847-b02d-d288f3fbeeb2@amd.com>
In-Reply-To: <32e96be9-a987-4847-b02d-d288f3fbeeb2@amd.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Sat, 16 May 2026 06:57:23 +0530
X-Gm-Features: AVHnY4KJPM6i6_WJQA-9eYv2Vf-xc3JrjXWgEPVFiQ1CaIVYdKqcVVMtCjHedSs
Message-ID: <CANTFpSV91DjxSFSmc5gCQ5YTy+Oubg11+55V3z-Xg2nM8TKvpA@mail.gmail.com>
Subject: Re: [PATCH v3 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	andriy.shevchenko@intel.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E293C559C61
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36958-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 23:04, Mario Limonciello wrote:
> I have another idea.  Why don't we just move pinctrl-amd to initialize
> earlier?  That should avoid the problem without more quirks I think.

I tested this. Here are the results across four combinations on my
machine (Lenovo Yoga 7 14AGP11 (83TD)):

  subsys_initcall alone:            arbitration errors, WACF2200 does not p=
robe
  subsys_initcall + patch 1:        arbitration errors persist
  patch 1 alone:                    arbitration errors persist
  patch 1 + patch 2 (v3):          clean boot, touchscreen fully functional

The subsys_initcall promotion does not seem to resolve the race on
this hardware,
i2c_designware is still probing AMDI0010:02 before pinctrl-amd finishes
regardless of the earlier initcall level. The explicit device_is_bound()
deferral in patch 2 appears to be necessary to enforce the ordering.

I can provide the full dmesg for any combination, if it is useful.

Thanks,
Hardik

On Fri, 15 May 2026 at 23:04, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 5/15/26 11:15, Hardik Prakash wrote:
> > The Wacom WACF2200 touchscreen on the Lenovo Yoga 7 14AGP11 (83TD) is
> > non-functional on Linux due to two bugs. Patch 1 (pinctrl-amd GPIO IRQ
> > fix) has already been taken into Linus Walleij's tree. This v3 resend
> > covers patch 2 only, addressing Andy Shevchenko's formatting feedback.
> >
> > Root cause: i2c_designware probes AMDI0010:02 before pinctrl-amd's
> > probe completes, so GPIO 157 (WACF2200 GpioInt per ACPI _CRS) has its
> > interrupt bits cleared when the first I2C transaction is attempted,
> > causing lost arbitration errors. The udev rebind workaround (which
> > works because pinctrl-amd has finished by userspace time) confirms
> > probe ordering as the root cause.
> >
> > Note: the dual-master hypothesis raised by Mario Limonciello was
> > investigated. TPNL's _DSM (UUID 3cdff6f7-4267-4555-ad05-b30a3d8938de)
> > is a pure query method returning a constant HID descriptor address with
> > no side effects, making firmware acting as secondary I2C master unlikel=
y
> > on this hardware. Awaiting Mario and Bart's technical verdict before
> > any further approach changes.
> >
> > v3:
> >   - Patch 2 only (patch 1 already in Linus Walleij's tree)
> >   - Fix variable declaration style in dw_i2c_needs_amd_gpio_dep (Andy S=
hevchenko)
> >   - Add BugLink tag (Andy Shevchenko)
> >   - Add -v3 subject versioning (Andy Shevchenko)
> >   - CC AMD engineers (Andy Shevchenko)
> >
> > v2:
> >   - Replace custom HID/UID lookup with acpi_dev_get_first_match_dev() (=
Andy Shevchenko)
> >   - Use acpi_get_first_physical_node() for platform device lookup
> >   - Use device_is_bound() under device_lock() with explanatory comments
> >   - Fix dev_warn to use dev_name() instead of hardcoded suffix
> >   - Fix commit message (removed incorrect "existing" reference)
> >   - Add Assisted-by tags per coding-assistants.rst
> >
> > Kernel bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D221494
> > Related: https://bugzilla.kernel.org/show_bug.cgi?id=3D221454
> >
> > Hardik Prakash (1):
> >    i2c: designware: fix probe ordering for AMD GPIO on Lenovo Yoga 7
> >      14AGP11
> >
> >   drivers/i2c/busses/i2c-designware-platdrv.c | 77 ++++++++++++++++++++=
+
> >   1 file changed, 77 insertions(+)
>
> I have another idea.  Why don't we just move pinctrl-amd to initialize
> earlier?  That should avoid the problem without more quirks I think.
>
> Something like this:
>
> =E2=95=B0=E2=94=80=E2=9D=AF git diff
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.=
c
> index e3128b0045d22..56a189082351b 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -1292,7 +1292,18 @@ static struct platform_driver amd_gpio_driver =3D =
{
>          .remove         =3D amd_gpio_remove,
>   };
>
> -module_platform_driver(amd_gpio_driver);
> +static int __init amd_gpio_init(void)
> +{
> +       return platform_driver_register(&amd_gpio_driver);
> +}
> +subsys_initcall(amd_gpio_init);
> +
> +static void __exit amd_gpio_exit(void)
> +{
> +       platform_driver_unregister(&amd_gpio_driver);
> +}
> +module_exit(amd_gpio_exit);
>
>   MODULE_AUTHOR("Ken Xue <Ken.Xue@amd.com>, Jeff Wu <Jeff.Wu@amd.com>");
>   MODULE_DESCRIPTION("AMD GPIO pinctrl driver");
> +MODULE_LICENSE("GPL");
>

