Return-Path: <linux-gpio+bounces-36810-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DoTFgxhBWrsVgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36810-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 07:43:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 418C253E0F7
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 07:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AEE73301902A
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F1D3BED75;
	Thu, 14 May 2026 05:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fm8Us8VO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249CB390229
	for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 05:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778737417; cv=pass; b=Y/mNI/9PJuiiZGorJniOuBlvwlgAPXaQnWKkVJclhE2WFqFTqe29LYNZBIYqoT+e+OjoftQMQBl8WhfGFXlqDnDSjAOppTMk2pRWmAnVNh50DSF5xMY16guDPChvtIiv1YUCjWnkivzZRb0Uw6oS+fjanq1lEtlIwsE5fUCF2c8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778737417; c=relaxed/simple;
	bh=pOHYqWKijmVMaPSKh3wPRRmTmuUJ640n8HPySIwwFEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFA/Zo+tuStv50nSvhrHJA49wnsGmmswauokIKacIfGSE/psrAl2qc2KhGLOVh08TbJOlqOubaVgYG2SToTdIpbO7BNY/Ao3pnM/EOQA+zq+8W2rqk5jLjxznPIp4xjuLNGq/TU4aduzmIKfITLksMbPp3FXQhT+/IJNcHNfX3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fm8Us8VO; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c477a3278so8293385d50.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 22:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778737413; cv=none;
        d=google.com; s=arc-20240605;
        b=Fe0y0JZCcnnRxmem2GIRDxSJXB20WgMbcGb28JkVblMUSEfEabFWTVc509QxI0UHWP
         3aVCX7PhrgJT5NDr/yEtUgLXmWwm3ZiH6iMJEdupaeXL3VjTlswxxGw+mMaXj3HrG/43
         cmzs66XBYAvIN9/H8ykC7qp8HzYLGdn5HTCrsn9xfx0K3bZAOYjWnhp2SQfK93etTdwT
         SD6enp4XS+9fD0ohWS8WWxO7Cy2mskndnPFT7Y8W3SfRLF8GudAI4wb4lad5GQBncsqb
         xLdfu+f6Ua3YZgw1mHtqCZFvIWQk9qJXcRzbLy09y2MqJkUldaBva2p91kvl85o8dP+M
         DRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oXKTHP/eux7T9NrJ7S3Pcfd9OPDd2OrG1ynLLeKgb7g=;
        fh=RDCZi5Mj4OINTlGyFKfXboilTOEtObQldTlYVup0MOA=;
        b=TRXpwN1A4ynPmJnORQ5bGJzck6Ue6g5aXs9ubVLqA5IdfHi8E86xppbO872SxkDtmM
         eea9+tDUpdTL1RcaaP7JaDfPuQzJjDoo5FrcIYxOmBjemfdh99BokT5er5Qs8npNqgQL
         bFAKxDroHAvAxBw+y0P1lxXSoCBna/Z1N5tC7IdN0GOghYXXkVUZVZoM98k6rBa//O6a
         GroJrT57qLw4goqwY1eeW69R0uGygk8a9G60U2PpSpBffhZ+pbapbczoWXnpsaJdJktK
         G/SDRIaTCWEcty61j9O5KulTb+dijg7ErFdcUrKqnBqD/tJZu0P3RG1hzjf/tm1LeErJ
         MgFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778737413; x=1779342213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXKTHP/eux7T9NrJ7S3Pcfd9OPDd2OrG1ynLLeKgb7g=;
        b=Fm8Us8VOiYPWsj++MxfAaU6QL0cWjpc7JHq7mfhLzuxezjU0sHI2D0NZwhcLgHEELg
         6DyNm3h2wnavRhx3moxOSGuiwWU8wZI0MdqPYBcTwiOSCuYnKeL4/hUMeb/ZLirPBRC8
         vsaYZELrZJogrMHYgkKFy6onTZbfrU1yA/rQXCPYRoA78TzVHOBXg/ez7rm7bBnYKksy
         Vdl9s5tr6jY21GfLR5EWoKKEUHePGD5u3ULKedsEdeMj3pdGXsugz6Q75TEVOG37LoNd
         hk/In6MPjTtb7L/guZRpE0VvwMsZzlzCPvhQlTGHBmnlD6gAjYYYmFQEU7qzDYGib01O
         ttCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778737413; x=1779342213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXKTHP/eux7T9NrJ7S3Pcfd9OPDd2OrG1ynLLeKgb7g=;
        b=YsUVRZcvPEIzCa+e5qi4rRjeoihdfxpip+bMTcywdy1aCOWEUJ8Wk7f9NSiTk6YB5n
         n4UCSlq76UhyecttM3DHJ4Xc4PzUOmNrCPt4nkbrhB2H1xnU6upb3Y0Ax2mRIWEgjcgq
         sSWSQ0E92Avkt8Yus9ZRThxIGxoS+YtC4G/quk6a06dfP97oIqR2Fb2aCG4GqJflhEzo
         D+fv0OzY1UFbAaXetDDMU9+RBBh1/2vvpDfwKYfYPinxxNWW0gTmbH7+c1XB6E4v/D8r
         2kmPlADyESKJFkOn0sFUNhZZQR73hDfeS+KDLbqWmhEFVVzJzdfjDYx5WBi8d/NtcmLt
         WG6w==
X-Gm-Message-State: AOJu0Yyem7T20zlXFiyR0C0iifeBqtJExeVDDnI7XC03Uh21fxLNcoRm
	RElG7arTBcoUjBsBszewsfKGVoLcOKfOkYH1e7BG3LYwdeOazB0yl02yPkaKC2XWi7DmTu1j4yY
	YDeyNDPBIlQxIh8CggbseEBmDbPTEbeE=
X-Gm-Gg: Acq92OERx2rvv61bqrcyyE8rJp7CJ8coMe6cO7oIwDx2Yz+gXkhLPVtUAFCVEDu+mIY
	3r0F+whfaCuijOXfLwrFZDw1eKdmLe5iooNlKFaU48adK024KRkzXgia//MPCiWolrNKff/DWTl
	Phg0iyQ2f56/ElM0HKHfuW5RuQoM1Wb2Sd4x5mpNrafB0SvRxQ2LAUbG+L3SHHJH2miztt5cMxb
	ZnfNwFWWkPtSPWQGx+DGToKPyJab60HOQ1kgT6b2T9n/LM0cC/6MYQXtm6MHQ85yuAL3Xt9dCKY
	NcHRAlBLHnzBU7OnOAXuD+7GpK3yOulpdFsh6aDi+dBJPsFDjB8I+jIrjP2SMUeON17QrBejUPz
	jyMpkojGahPk0P3lnzyGXhSpIbV+Z/ElyrYd436pEZVi+33uDJTzFQEuNnD+5s9KM4lHyFg==
X-Received: by 2002:a05:690e:169e:b0:654:1934:3773 with SMTP id
 956f58d0204a3-65df8260476mr5820940d50.30.1778737413026; Wed, 13 May 2026
 22:43:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513061338.9348-1-hardikprakash.official@gmail.com>
 <20260513061338.9348-3-hardikprakash.official@gmail.com> <agSw-Y_jjliO1gaE@ashevche-desk.local>
 <705ef2f4-3bdf-4e7c-be9c-980cc0a21544@kernel.org> <CANTFpSU=94RuX1uFf4UitRyzLPvu=cTF_S5khjjJNQUU1T_PtA@mail.gmail.com>
 <CANTFpSXBoiebqZEsZA644KukzFceYK1Ogvmioxv+Lqswy_OThw@mail.gmail.com>
In-Reply-To: <CANTFpSXBoiebqZEsZA644KukzFceYK1Ogvmioxv+Lqswy_OThw@mail.gmail.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Thu, 14 May 2026 11:13:21 +0530
X-Gm-Features: AVHnY4KiACHsCylxl9u8OV3qI8yodCeJOP5l7LCup2nTrMNRYEdM81QRFtXKlKo
Message-ID: <CANTFpSU1_Y8=BqsSUw=PTsss+Sq8on9Zsh02ROfgy=n7QWhFyA@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: designware: fix probe ordering for AMD GPIO on
 Lenovo Yoga 7 14AGP11
To: Mario Limonciello <superm1@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, brgl@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linus.walleij@linaro.org, wsa@kernel.org, basavaraj.natikar@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 418C253E0F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36810-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 22:58, Mario Limonciello wrote:
> Could this be something similar that really calling the _DSM is the
> missing link?

Correction to my previous reply =E2=80=94 I've now disassembled the DSDT an=
d
looked at the _DSM content directly.

TPNL's _DSM (UUID 3cdff6f7-4267-4555-ad05-b30a3d8938de):
  Function 0 (revision 1): returns 0x03 (functions 0 and 1 supported)
  Function 1: returns integer 1 (HID descriptor address)
  All other functions: return 0

There are no side effects =E2=80=94 no power sequencing, no GPIO operations=
,
no bus ownership transfer. It is a pure query method that returns a
constant HID descriptor address. This makes the dual-master scenario
less likely for this hardware than it was for the Dell case.

Based on the DSDT, I don't see evidence that the firmware is acting as
a secondary I2C master, or that calling the _DSM earlier would change
the bus arbitration behaviour. The arbitration errors on this system
appear to be explained by the GPIO IRQ not being enabled (patch 1) and
the probe ordering race (patch 2).

That said, I could be wrong =E2=80=94 if you see something in the DSDT or
elsewhere that suggests otherwise, I'm happy to test a different
approach.

Thanks,
Hardik

On Thu, 14 May 2026 at 10:44, Hardik Prakash
<hardikprakash.official@gmail.com> wrote:
>
> (Resending with full Cc list =E2=80=94 apologies for the missed recipient=
s.)
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
> On Thu, 14 May 2026 at 10:37, Hardik Prakash
> <hardikprakash.official@gmail.com> wrote:
> >
> > On Wed, May 13, 2026 at 22:58, Mario Limonciello wrote:
> > > Yeah; I tend to think doing this with a quirk is hiding a bug.
> > >
> > > Are you sure this isn't a case of two masters on the bus?
> >
> > I looked into this after your email. The DSDT for TPNL (WACF2200) does
> > have a _DSM with UUID 3cdff6f7-4267-4555-ad05-b30a3d8938de (HID I2C
> > Device). So yes =E2=80=94 this could be the same mechanism you saw on D=
ell.
> >
> > > Could this be something similar that really calling the _DSM is the
> > > missing link?
> >
> > Possibly. With my current patches applied, the probe ordering fix
> > ensures i2c_designware initialises AMDI0010:02 cleanly, i2c-hid
> > subsequently probes, and presumably calls the _DSM at that point =E2=80=
=94
> > which may be what finally releases the bus. Without the patches,
> > i2c-hid never gets that far.
> >
> > The question I can't answer yet is whether the _DSM needs to be called
> > *before* the first I2C bus transaction attempt, rather than at i2c-hid
> > probe time. If the firmware is acting as I2C master until the _DSM is
> > called, then the arbitration errors at 2.3s would be explained entirely
> > by the missing _DSM call, independent of the GPIO IRQ state.
> >
> > I'm investigating the _DSM content further. If you believe the correct
> > fix is an earlier _DSM call (similar to what 7d62beb did for S4), I'm
> > happy to test a patch for that approach and report back.
> >
> > Thanks,
> > Hardik
> >
> > On Wed, 13 May 2026 at 22:58, Mario Limonciello <superm1@kernel.org> wr=
ote:
> > >
> > > ++
> > >
> > > On 5/13/26 12:12, Andy Shevchenko wrote:
> > > > Please, Cc AMD people on the AMD related stuff.
> > > > +Cc: Mario
> > > >
> > > > +Cc: Bart
> > > > (the GPIO enumeration and checks, smells like it might be done diff=
erently).
> > >
> > > Yeah; I tend to think doing this with a quirk is hiding a bug.
> > >
> > > Are you sure this isn't a case of two masters on the bus?
> > >
> > > [    2.286838] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lo=
st
> > > arbitration
> > > [    2.286887] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lo=
st
> > > arbitration
> > > [    2.286923] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lo=
st
> > > arbitration
> > > [    2.286964] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lo=
st
> > > arbitration
> > > [    2.287521] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lo=
st
> > > arbitration
> > > [    2.287569] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lo=
st
> > > arbitration
> > > [    2.287616] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lo=
st
> > > arbitration
> > > [    2.287658] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lo=
st
> > > arbitration
> > >
> > > I saw something really similar on a Dell platform last year; but arou=
nd S4.
> > >
> > > It ended up being a situation that the EC had way to act as I2C maste=
r
> > > and until the right method from I2C-HID was called it thought it was
> > > still I2C master.
> > >
> > > https://git.kernel.org/torvalds/c/7d62beb102d6f
> > >
> > > Could this be something similar that really calling the _DSM is the
> > > missing link?
> > >
> > > >
> > > > On Wed, May 13, 2026 at 11:43:38AM +0530, Hardik Prakash wrote:
> > > >> On Lenovo Yoga 7 14AGP11 (83TD), the WACF2200 touchscreen fails wi=
th
> > > >> lost arbitration errors on AMDI0010:02 at boot. The root cause is =
a
> > > >> probe ordering issue: i2c_designware probes AMDI0010:02 before
> > > >> pinctrl-amd has finished initialising, so the GPIO 157 interrupt
> > > >> needed by the touchscreen is not yet enabled.
> > > >>
> > > >> Add a DMI-matched deferral in dw_i2c_plat_probe() that uses
> > > >> device_is_bound() under device_lock() to correctly wait until
> > > >> pinctrl-amd's probe has fully completed. Use acpi_dev_get_first_ma=
tch_dev()
> > > >> for robust HID/UID-based GPIO controller lookup instead of string
> > > >> name matching.
> > > >
> > > > ...
> > > >
> > > >> +static bool dw_i2c_needs_amd_gpio_dep(struct device *device)
> > > >> +{
> > > >> +    struct acpi_device *adev =3D ACPI_COMPANION(device);
> > > >
> > > > Split hard-to-maintain definition and assignment that's going to be=
 validated.
> > > >
> > > >> +    if (!dmi_check_system(dw_i2c_amd_gpio_defer_dmi))
> > > >> +            return false;
> > > >> +    if (!adev)
> > > >> +            return false;
> > > >
> > > >       struct acpi_device *adev;
> > > >
> > > >       if (!dmi_check_system(dw_i2c_amd_gpio_defer_dmi))
> > > >               return false;
> > > >
> > > >       adev =3D ACPI_COMPANION(device);
> > > >       if (!adev)
> > > >               return false;
> > > >
> > > >> +    return acpi_dev_hid_uid_match(adev, "AMDI0010", "2");
> > > >> +}
> > > >
> > > > ...
> > > >
> > > >> +static int dw_i2c_defer_for_amd_gpio(struct device *device)
> > > >> +{
> > > >> +    struct acpi_device *gpio_adev;
> > > >> +    struct device *gpio_dev;
> > > >> +
> > > >> +    if (!dw_i2c_needs_amd_gpio_dep(device))
> > > >> +            return 0;
> > > >> +
> > > >> +    /*
> > > >> +     * Find the AMD GPIO controller by HID/UID and get its physic=
al
> > > >> +     * platform device. We need the platform device (not the ACPI=
 device)
> > > >> +     * because that is what gets bound by the amd_gpio driver.
> > > >> +     */
> > > >> +    gpio_adev =3D acpi_dev_get_first_match_dev("AMDI0030", "0", -=
1);
> > > >> +    if (!gpio_adev)
> > > >> +            return -EPROBE_DEFER;
> > > >
> > > > Hmm... This is interesting case, smells like something similar to w=
hat we had
> > > > with x86 Android quirk driver. Cc'ed to Bart to briefly look at thi=
s.
> > > >
> > > >> +    gpio_dev =3D acpi_get_first_physical_node(gpio_adev);
> > > >> +    acpi_dev_put(gpio_adev);
> > > >> +    if (!gpio_dev)
> > > >> +            return -EPROBE_DEFER;
> > > >> +
> > > >> +    /*
> > > >> +     * Check that amd_gpio probe has fully completed, not just th=
at the
> > > >> +     * driver pointer is set. The driver pointer is assigned befo=
re probe
> > > >> +     * finishes, so checking it would allow i2c_designware to pro=
be before
> > > >> +     * the GPIO IRQ quirk in amd_gpio_probe() has run.
> > > >> +     */
> > > >> +    device_lock(gpio_dev);
> > > >> +    if (!device_is_bound(gpio_dev)) {
> > > >> +            device_unlock(gpio_dev);
> > > >> +            return -EPROBE_DEFER;
> > > >> +    }
> > > >> +    device_unlock(gpio_dev);
> > > >> +
> > > >> +    /*
> > > >> +     * Create a device link so the driver core enforces probe/rem=
ove
> > > >> +     * ordering between this I2C controller and the GPIO controll=
er.
> > > >> +     */
> > > >> +    if (!device_link_add(device, gpio_dev, DL_FLAG_AUTOREMOVE_CON=
SUMER))
> > > >> +            dev_warn(device, "failed to add device link to %s\n",
> > > >> +                     dev_name(gpio_dev));
> > > >> +
> > > >> +    return 0;
> > > >> +}
> > > >
> > >

