Return-Path: <linux-gpio+bounces-36809-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPAOAFxaBWomVQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36809-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 07:15:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E5A53DF01
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 07:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D6EE3014A0F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CBA3AE1B9;
	Thu, 14 May 2026 05:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBvMmITC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182261C5F39
	for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 05:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778735702; cv=pass; b=HMlb+NBAzbUH+5guAEjcU2rifUcFTpYwvgeMN2P3i6WviPM/JopelFtCe+9duc8Qjj+3uO4SxHPX4dTQt9h5Jbhhi9efTTheZjidreoLEJDxZ5XcyXsXafup7YG8KEHAzxjxhV5blfOht0Urztw7yglJHFVKvnx2TCHCQewsZwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778735702; c=relaxed/simple;
	bh=Esa6aMxHc3lqCK14T6SUOgeyDUdsfbMrcCgZll//QZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSAskgivYxSiOrjVMCB1Zt5wSkXYfF18Q/yy0HPpbMOZcfB1uw4rSDNP7v28WFZFnq1Bd0rNuja1ZXJYu9nPLWFtQkpGktuyWP2H2b0PF9swZFHCFHJgqf5CQIxNEeqHrbG26h4RLE8KS9mre9WHEr9t0G4mp1/GD4Nc+JXRCIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBvMmITC; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c2cd216c9so7934006d50.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 22:15:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778735699; cv=none;
        d=google.com; s=arc-20240605;
        b=ad4TG8gzonG1+hwiDLZnoq9fR2vAzKhBwsDm+ni6JyWXWw45bKJRpJ6MLyvF/+wpT8
         goGxWqXNZBiNBhjSOlYiutsLh3T/3kInTap31XkcCnIV1gElAq5imjeReaeWx85FZ83J
         5FGDpq9vquOu4mX1l6mpLF8AJf7b7h8rUuB15FskGgwik7ZhclRnyPuNynlUH+rFL7LY
         1XtwkiSPnQqZ9gcnYfxZ8AWFPr7ZG+ENC0PpzHf+YK4K7Qp17rxmo797trL+YOMCJgxa
         +kPqJUXQ0deiGkDxqB4yysZbEHg2dTLm6/XLilpAXnZ1TkreXiVuGds3weep5vRDB/TN
         gXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rNR/KRKvO9xK0+jIcZNTqxkNkqR2qZPifnFqEZLSgko=;
        fh=RDCZi5Mj4OINTlGyFKfXboilTOEtObQldTlYVup0MOA=;
        b=JbjR4g/P9Vlc2J4BtqCc64+syUkuHBF64jJDF55Pq0rjs0H9y2xm+6YFotdXznJfIK
         Vg61tyh9CFK/CYVwMOk/mr65BGUvw9N1gBKVIbFWI0OzfZpEsqFHAiIRkEjviwMw47z0
         dnkShFemUyc+Dur/4GTq5jh7Bd5gjmSwrCQLUcefyso/ifjYJVZotjJwuNkxswsyVe6z
         4osIdNYhyaQWFzaeEV+MRhcfs1BzkRxbL4P9LK1q/iP3x1eec4POtlv2as6D9qzkaQc9
         PidNLxG+vv5CgUsv89vyu5hElWmYN6KZf+uceTkeCfwl26o0orSuoDIxuWlAJ6EjB9na
         iyRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778735699; x=1779340499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNR/KRKvO9xK0+jIcZNTqxkNkqR2qZPifnFqEZLSgko=;
        b=CBvMmITC/CQ9nf4WSprwi2cUlk4W/fstP7Jr0F99Xqafrgu2dJpX6kbSZolGD2if0n
         7eLW/RfAI5f4i9nypEyLGx0rTnMD/fdYlenKqSyEJIipD+dHPKau0selJ5l/zT/zDkqk
         M6l/lnEVCL+rVxPsOQZITGaTXLDSp6CC7DwcyHoLddJTuymIlbx6Wxunoh0QCG+yCiHZ
         U9mxWk/NnYvuY7XfZJuKUVtRlMjKJe0CVp8hdNdnzT78dX65rtIHJXFTKIwMTQ/I6OsU
         1kXGzJ4GdxHod5l1rpSZBQWtzvoT2kFPfoi14sMsaWUdvSQFyUvLcWsReVF3RYc9+6aw
         82sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778735699; x=1779340499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rNR/KRKvO9xK0+jIcZNTqxkNkqR2qZPifnFqEZLSgko=;
        b=UqAx9/oGJepbqrPnLByktXTlbDv2ZPbQtnnOD5lLdScKqFKPwMgXQsxqOGva+QiB1T
         OV6r73w0bLpl/QIMCfXBpXDCTj+hc4Tv7uJ0a/leZdY3QtvZUn21BMalWVmI84Keykhe
         2SA1yxjtgBW/iPb8kNFPlwaHQdRUufh2gP2JD1/oXVR2jg6fcvX0a+1lzKqdi+3ymaMQ
         7j9Ga689vvhhO4hR6pPo2urQ+ejKxoz1KTeJvrxpeshi84bk8btxoK+n6EzXvhNwXkDG
         zw1DkQhLdAdC3T0Ev+/5UQO9l/NVkQLzAB25hfIrvFfJrLSddrzEI3vQXBCqehSLqTnH
         ivrA==
X-Gm-Message-State: AOJu0YykY0MCL0iXlTtOaLlk026AgNm/kELjL8bji6Wm5PZpQkir9KvX
	9D6pipS5zzn69BNshUoKOWMpBLu8A8ehuSubJhwZeUM9zUxEhLKE1MS7ckRvZJgZccJcYkMXm4K
	XcrfZBaRU78ivov+HX5xySqRgqdT2cbU=
X-Gm-Gg: Acq92OFHBzENmS0gh2JG2IzvZCBFpzhkoOUw37vAvYDoc6F5KxgRpzH2WFGOvwqTkMi
	MqAeBHEkZM8iYgqP41vMTm5cysG1t+mJN3lG2AYtzzUTqH6RnVQrLXGyOm/lLpwzqC/rwYnndo6
	8bPjjjk1REIlrexzYU7qBnT8fclMlsfdWjS0jwozxEWHO+5rGVKTYB3cqt/m+U2SCz2MHpXY5Ok
	Pgts5wRiDBQ400MSWEWoytX/AzZGWk50vDtSojugyZVYzMeWpnMuJnks5YOrKn0qt2V2l0MKdQU
	9K3yZORlSt9vt9T26FFxEg+CKUHA8f7gL9Oc//z5KOo8ae2s+lSElP+wVQQSk8nhbLwO4jO7KH5
	ul5UryzTjhq6qDOjH1xiGajt4ds7rJtvm0rc5mTKTgKHuocj4sGx3S0MdSK8U1COMQDcw2w==
X-Received: by 2002:a05:690e:1404:b0:653:3d0:f2b2 with SMTP id
 956f58d0204a3-65df6231b18mr6271191d50.20.1778735698888; Wed, 13 May 2026
 22:14:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513061338.9348-1-hardikprakash.official@gmail.com>
 <20260513061338.9348-3-hardikprakash.official@gmail.com> <agSw-Y_jjliO1gaE@ashevche-desk.local>
 <705ef2f4-3bdf-4e7c-be9c-980cc0a21544@kernel.org> <CANTFpSU=94RuX1uFf4UitRyzLPvu=cTF_S5khjjJNQUU1T_PtA@mail.gmail.com>
In-Reply-To: <CANTFpSU=94RuX1uFf4UitRyzLPvu=cTF_S5khjjJNQUU1T_PtA@mail.gmail.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Thu, 14 May 2026 10:44:47 +0530
X-Gm-Features: AVHnY4I4_ClSXDmZ88nPOZOPNVNTwSxsM3n99Z3_DfzSd8a_608FgZvdDAFMfjY
Message-ID: <CANTFpSXBoiebqZEsZA644KukzFceYK1Ogvmioxv+Lqswy_OThw@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: designware: fix probe ordering for AMD GPIO on
 Lenovo Yoga 7 14AGP11
To: Mario Limonciello <superm1@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, brgl@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linus.walleij@linaro.org, wsa@kernel.org, basavaraj.natikar@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: F0E5A53DF01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36809-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

(Resending with full Cc list =E2=80=94 apologies for the missed recipients.=
)

On Wed, May 13, 2026 at 22:58, Mario Limonciello wrote:
> Yeah; I tend to think doing this with a quirk is hiding a bug.
>
> Are you sure this isn't a case of two masters on the bus?

I looked into this after your email. The DSDT for TPNL (WACF2200) does
have a _DSM with UUID 3cdff6f7-4267-4555-ad05-b30a3d8938de (HID I2C
Device). So yes =E2=80=94 this could be the same mechanism you saw on Dell.

> Could this be something similar that really calling the _DSM is the
> missing link?

Possibly. With my current patches applied, the probe ordering fix
ensures i2c_designware initialises AMDI0010:02 cleanly, i2c-hid
subsequently probes, and presumably calls the _DSM at that point =E2=80=94
which may be what finally releases the bus. Without the patches,
i2c-hid never gets that far.

The question I can't answer yet is whether the _DSM needs to be called
*before* the first I2C bus transaction attempt, rather than at i2c-hid
probe time. If the firmware is acting as I2C master until the _DSM is
called, then the arbitration errors at 2.3s would be explained entirely
by the missing _DSM call, independent of the GPIO IRQ state.

I'm investigating the _DSM content further. If you believe the correct
fix is an earlier _DSM call (similar to what 7d62beb did for S4), I'm
happy to test a patch for that approach and report back.

Thanks,
Hardik

On Thu, 14 May 2026 at 10:37, Hardik Prakash
<hardikprakash.official@gmail.com> wrote:
>
> On Wed, May 13, 2026 at 22:58, Mario Limonciello wrote:
> > Yeah; I tend to think doing this with a quirk is hiding a bug.
> >
> > Are you sure this isn't a case of two masters on the bus?
>
> I looked into this after your email. The DSDT for TPNL (WACF2200) does
> have a _DSM with UUID 3cdff6f7-4267-4555-ad05-b30a3d8938de (HID I2C
> Device). So yes =E2=80=94 this could be the same mechanism you saw on Del=
l.
>
> > Could this be something similar that really calling the _DSM is the
> > missing link?
>
> Possibly. With my current patches applied, the probe ordering fix
> ensures i2c_designware initialises AMDI0010:02 cleanly, i2c-hid
> subsequently probes, and presumably calls the _DSM at that point =E2=80=
=94
> which may be what finally releases the bus. Without the patches,
> i2c-hid never gets that far.
>
> The question I can't answer yet is whether the _DSM needs to be called
> *before* the first I2C bus transaction attempt, rather than at i2c-hid
> probe time. If the firmware is acting as I2C master until the _DSM is
> called, then the arbitration errors at 2.3s would be explained entirely
> by the missing _DSM call, independent of the GPIO IRQ state.
>
> I'm investigating the _DSM content further. If you believe the correct
> fix is an earlier _DSM call (similar to what 7d62beb did for S4), I'm
> happy to test a patch for that approach and report back.
>
> Thanks,
> Hardik
>
> On Wed, 13 May 2026 at 22:58, Mario Limonciello <superm1@kernel.org> wrot=
e:
> >
> > ++
> >
> > On 5/13/26 12:12, Andy Shevchenko wrote:
> > > Please, Cc AMD people on the AMD related stuff.
> > > +Cc: Mario
> > >
> > > +Cc: Bart
> > > (the GPIO enumeration and checks, smells like it might be done differ=
ently).
> >
> > Yeah; I tend to think doing this with a quirk is hiding a bug.
> >
> > Are you sure this isn't a case of two masters on the bus?
> >
> > [    2.286838] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost
> > arbitration
> > [    2.286887] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost
> > arbitration
> > [    2.286923] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost
> > arbitration
> > [    2.286964] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost
> > arbitration
> > [    2.287521] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost
> > arbitration
> > [    2.287569] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost
> > arbitration
> > [    2.287616] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost
> > arbitration
> > [    2.287658] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost
> > arbitration
> >
> > I saw something really similar on a Dell platform last year; but around=
 S4.
> >
> > It ended up being a situation that the EC had way to act as I2C master
> > and until the right method from I2C-HID was called it thought it was
> > still I2C master.
> >
> > https://git.kernel.org/torvalds/c/7d62beb102d6f
> >
> > Could this be something similar that really calling the _DSM is the
> > missing link?
> >
> > >
> > > On Wed, May 13, 2026 at 11:43:38AM +0530, Hardik Prakash wrote:
> > >> On Lenovo Yoga 7 14AGP11 (83TD), the WACF2200 touchscreen fails with
> > >> lost arbitration errors on AMDI0010:02 at boot. The root cause is a
> > >> probe ordering issue: i2c_designware probes AMDI0010:02 before
> > >> pinctrl-amd has finished initialising, so the GPIO 157 interrupt
> > >> needed by the touchscreen is not yet enabled.
> > >>
> > >> Add a DMI-matched deferral in dw_i2c_plat_probe() that uses
> > >> device_is_bound() under device_lock() to correctly wait until
> > >> pinctrl-amd's probe has fully completed. Use acpi_dev_get_first_matc=
h_dev()
> > >> for robust HID/UID-based GPIO controller lookup instead of string
> > >> name matching.
> > >
> > > ...
> > >
> > >> +static bool dw_i2c_needs_amd_gpio_dep(struct device *device)
> > >> +{
> > >> +    struct acpi_device *adev =3D ACPI_COMPANION(device);
> > >
> > > Split hard-to-maintain definition and assignment that's going to be v=
alidated.
> > >
> > >> +    if (!dmi_check_system(dw_i2c_amd_gpio_defer_dmi))
> > >> +            return false;
> > >> +    if (!adev)
> > >> +            return false;
> > >
> > >       struct acpi_device *adev;
> > >
> > >       if (!dmi_check_system(dw_i2c_amd_gpio_defer_dmi))
> > >               return false;
> > >
> > >       adev =3D ACPI_COMPANION(device);
> > >       if (!adev)
> > >               return false;
> > >
> > >> +    return acpi_dev_hid_uid_match(adev, "AMDI0010", "2");
> > >> +}
> > >
> > > ...
> > >
> > >> +static int dw_i2c_defer_for_amd_gpio(struct device *device)
> > >> +{
> > >> +    struct acpi_device *gpio_adev;
> > >> +    struct device *gpio_dev;
> > >> +
> > >> +    if (!dw_i2c_needs_amd_gpio_dep(device))
> > >> +            return 0;
> > >> +
> > >> +    /*
> > >> +     * Find the AMD GPIO controller by HID/UID and get its physical
> > >> +     * platform device. We need the platform device (not the ACPI d=
evice)
> > >> +     * because that is what gets bound by the amd_gpio driver.
> > >> +     */
> > >> +    gpio_adev =3D acpi_dev_get_first_match_dev("AMDI0030", "0", -1)=
;
> > >> +    if (!gpio_adev)
> > >> +            return -EPROBE_DEFER;
> > >
> > > Hmm... This is interesting case, smells like something similar to wha=
t we had
> > > with x86 Android quirk driver. Cc'ed to Bart to briefly look at this.
> > >
> > >> +    gpio_dev =3D acpi_get_first_physical_node(gpio_adev);
> > >> +    acpi_dev_put(gpio_adev);
> > >> +    if (!gpio_dev)
> > >> +            return -EPROBE_DEFER;
> > >> +
> > >> +    /*
> > >> +     * Check that amd_gpio probe has fully completed, not just that=
 the
> > >> +     * driver pointer is set. The driver pointer is assigned before=
 probe
> > >> +     * finishes, so checking it would allow i2c_designware to probe=
 before
> > >> +     * the GPIO IRQ quirk in amd_gpio_probe() has run.
> > >> +     */
> > >> +    device_lock(gpio_dev);
> > >> +    if (!device_is_bound(gpio_dev)) {
> > >> +            device_unlock(gpio_dev);
> > >> +            return -EPROBE_DEFER;
> > >> +    }
> > >> +    device_unlock(gpio_dev);
> > >> +
> > >> +    /*
> > >> +     * Create a device link so the driver core enforces probe/remov=
e
> > >> +     * ordering between this I2C controller and the GPIO controller=
.
> > >> +     */
> > >> +    if (!device_link_add(device, gpio_dev, DL_FLAG_AUTOREMOVE_CONSU=
MER))
> > >> +            dev_warn(device, "failed to add device link to %s\n",
> > >> +                     dev_name(gpio_dev));
> > >> +
> > >> +    return 0;
> > >> +}
> > >
> >

