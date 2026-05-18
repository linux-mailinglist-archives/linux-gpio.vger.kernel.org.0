Return-Path: <linux-gpio+bounces-37060-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HrXOVcXC2o5/wQAu9opvQ
	(envelope-from <linux-gpio+bounces-37060-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 15:42:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6820F56DD92
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 15:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BE37301A40D
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 13:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF8E481643;
	Mon, 18 May 2026 13:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s+XDhCim"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33D1846A
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 13:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111642; cv=pass; b=Ti1pW7oLCEe75z5UvvNib3Wv/JKnDG/feRd5jj5uSCGU1bHce9NzOXBV369xsdYghzXwqAbVRIdwn/QuV5AEGFIeJCxVZFFQbfzUCYJTTQBvmnaVF9vI+/rkEs03JKM/Wg/v2+7ndVsKWF5ddPAzC88tnvu0Y1uYikeWsAO/VaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111642; c=relaxed/simple;
	bh=Byx6HxjjOcWicJD2Q5fasjn2euE5iyByVMIaH1Tre40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IE99rOuSsU0gKqLAQuO4A906pWNWVNiSz9vcSSjxbtuLQP9zj8XOo4w+TKfOfkNZlRNaBDMcc/vqn7yqZcWEB7Hv/y0QJ9Xb4D+4LQjaV+LUj4+BrWa0r2su+Sj7IBij1wxz7lBL11EoBbo4HC7+Dbo2FrUTo8eCLRtLhGbdROo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s+XDhCim; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bd5e373d07so17283977b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 06:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779111640; cv=none;
        d=google.com; s=arc-20240605;
        b=CIqdJeRNQ1MRPWzetIiolJ/NlzObi9UDQ0zsAFGVUU6XawKEyKh64msaOxUrYYcPjr
         pKr90ax0VKsnEPFdhytgWsJaMAFiNAwHiDxsLFnlG04It1LYzZn4ZnrlteEcDInjYkjR
         HXwgOmV2yOXOgAaAgwJwEjHH0KbmXlKJSiJw31brhRlSYMcrP55z39/jPnDsOiJJcOKM
         4VNVgDA2KhhfuVhxKbNcx3GHw8A62OmzkjJ416D8zxe6KyM+AoQY0yR3gK68e3nBQehZ
         SfzR0B7vMLjEf2KBSmLl0ZSL8IYJapJWSyx+mUC0NlICVbDUBlOycAKMCHkNSSBvAVo+
         +syA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ffWEiO2cpDppGClUdUPZKnok9gRIvoU04CnIWfjJek=;
        fh=MlagglCcBPPCX2tzgO18gUxvQckkT7Li0+1TKXXRmTw=;
        b=FnMOGm/roKIdmocxXx6ywP+FxD/JBIrJOuMUXn5mh1USt+WeaiSlJTOqqmGqtrJfLi
         k8yku37K+V6rC20KgqpZSAPUvD5RIdFR4EHGobgAQ6HoB++VSGZX9BfNwH51rtYpkzX0
         KMbnOLhyfiwGhVg6fhKBummiuIoJ/RcOGS3WP+q8TKE7Ac++p/CFdt7Ramr5JMt4SJ+x
         CATtZML0IXPGfkD47r19HmJ0mYtpasyUm+TyPb/ewVL8wZsvT4ZUqYh09Q3t/JyC4yRf
         daL1Qews6TNn8Iysh4TUu5LfRJ09i4AdhBiR5EiuzVWe0abJCBBn0MvvzogwZEwuhf45
         fjNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779111640; x=1779716440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ffWEiO2cpDppGClUdUPZKnok9gRIvoU04CnIWfjJek=;
        b=s+XDhCiml308Xx1MO+X8Zf/W6GmX/NTRcRIjW/WPQ1iKK6UKqLxoVyYTlT5LqMkEaC
         R/ss1efWnTkUHHks7YbIsR2X0gpAv7o3jDZrZndyedZj6FkyhPNGKWYY+WfFXQw/F1Qg
         wDQSEdTdhfh7//xL+dBLOACJBiC7eDYC/aH6A/jMsGM8WnAW/a8D38H096H2SuCSy7PG
         CIdpnnOowYnsHWNtMFf27ykc/jdRr8gllg7vO7isRZg89YTGcX3n1ZE0BP9eshuYCRzJ
         EaIE6wyCNVu/kMsd/d5lxajTzmp7IhDIz6h7YXG1+rfqO6bukf4M6ErZSNRzJCn0+jKT
         nzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111640; x=1779716440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ffWEiO2cpDppGClUdUPZKnok9gRIvoU04CnIWfjJek=;
        b=ERz23QlpdIhUAajl2sHIsMEJuY3bBPxyvdUHkvh7KJZlN1WxNdL0o4+FYvVvkcGJ4H
         eWlANQB3sYxg0dKABL8v46jUUpxCg9F3kNUa0wk5IoiwRiJj4BBty2rAhw8y103E0tLs
         ggqr3IkRBLG8ikQ5Hvmm+SG/VZEOe+iCFUzq08SPHCyXwUkPmxcLClVT/w5v4exlXN1M
         pkMTOnsS0w27OPyoB4sipu19BvyBbAT94uRHAfTU90N8p1Jw3DGj6HgMlbnUgGPwDlG7
         YveDjxw+0ILhs9lOJck5WxshsIQFW8Bg02tA+duP0srO30MlRqJt0K7qUfWlLi4FKgAD
         9Dlw==
X-Forwarded-Encrypted: i=1; AFNElJ/MRs17Hvg2iP+jgMRXQYH1zXINmu/IzuueF/487QsSFVu7FK7zhKNBuQ7yHRfvYDC5FyZNrR3MxgAp@vger.kernel.org
X-Gm-Message-State: AOJu0YynTnL33WB3Gm3D1hWT+7yB/34XiF0b/Yc2y7fZ/OSEnjLrB2RS
	nUj+eiX7FCZtkWoaO1bMYiDijra/KrErPfD72OMtqpQfsepkzQWPenpIVzthLZp+tZCbcPuVKwz
	GlCEecyATR8eyd45IUJ/DZTNLMOyBIAg=
X-Gm-Gg: Acq92OExjRMUjSNG39zPbH97apOVN6k0+hv6fMlqKT/3HTMVJgmsomC5RhgjwI5cvjf
	+wdN6wBOm6OroWK9gfWfsq7Czu91f/9elpnUzKXYIjlxT5FfKTR0vpdNbxrYgW3BXPIKtjReeWX
	AeA7A+57JSrTcknuXqAnHgSIG562tbqE7AU/rEz+zYQF6Y12FbDj2Xygabp0Xr29qgj8aIRgCk4
	9jH3naAsdSXxdXbIZVFtn3OgLtDyZQ5lRcb7mL5QmI7Ab74LdfCm92LfYg31TE2Zriv604Wr2S2
	PNBSdFo9syftyBbf9avViMuy1I7ArMGnY/2hDBsfKPb/LQmLixow8jwTsfYFT8Is8GD2BDVe0Wh
	74AEExzlv4jhLFdY8VvWfXYOW8VgOEddKq3fBVykcGH52g4Ew1yhlzSI2lO4=
X-Received: by 2002:a05:690c:102:b0:7c0:8e1:51fe with SMTP id
 00721157ae682-7c95c2fe856mr169541917b3.43.1779111640087; Mon, 18 May 2026
 06:40:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518122814.8975-1-hardikprakash.official@gmail.com> <d57dd297-6be1-43a9-a38d-e40c8949e23a@amd.com>
In-Reply-To: <d57dd297-6be1-43a9-a38d-e40c8949e23a@amd.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Mon, 18 May 2026 19:10:28 +0530
X-Gm-Features: AVHnY4J_px-0DzMSs5QjONU5xX1nl7wIQnCETZ2u2Xvf9C5OnFcvb0gr6v2ga6s
Message-ID: <CANTFpSWGC7GsAY-3UvPtBZzqjNek-T5haiDb59QYRoRgwuQf1w@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	andriy.shevchenko@intel.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37060-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 6820F56DD92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 18:17, Mario Limonciello wrote:
> I'd still like to avoid a quirk if we can.
>
> I know my proposed patch to try to probe at an earlier stage didn't
> work, but could you perhaps try pulling pinctrl-amd even earlier?
>
> Maybe fs_initcall()?

Tested. fs_initcall + patch 1 still produces the same arbitration
errors:

  subsys_initcall + patch 1:   arbitration errors persist
  fs_initcall + patch 1:       arbitration errors persist
  patch 1 + patch 2 (v5):     clean boot, touchscreen fully functional

The initcall level does not appear to be the determining factor on
this hardware. i2c_designware is still probing AMDI0010:02 before
pinctrl-amd finishes regardless of how early pinctrl-amd registers.
The explicit device_is_bound() deferral in patch 2 is the only
approach that has worked.

Thanks,
Hardik

On Mon, 18 May 2026 at 18:17, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 5/18/26 07:28, Hardik Prakash wrote:
> > Patch 1/2 (pinctrl-amd GPIO IRQ fix) is already in Linus Walleij's
> > tree. This series contains only the i2c-designware probe ordering fix,
> > based on top of that commit.
> >
> > The root cause: i2c_designware probes AMDI0010:02 before pinctrl-amd
> > completes, so GPIO 157 (WACF2200 GpioInt per ACPI _CRS) has its
> > interrupt bits cleared when the first I2C transaction is attempted,
> > causing lost arbitration errors.
> >
> > A higher-level ACPI devlink approach was investigated in response to
> > Bartosz Golaszewski's suggestion. The DSDT has no _DEP object linking
> > AMDI0010:02 to AMDI0030:00, so fw_devlink has nothing to act on.
> > Setting this up at the ACPI layer would require either a firmware
> > change to add _DEP, or a DMI quirk in the ACPI scan path =E2=80=94 equa=
lly
> > quirk-based as the current approach.
>
> I'd still like to avoid a quirk if we can.
>
> I know my proposed patch to try to probe at an earlier stage didn't
> work, but could you perhaps try pulling pinctrl-amd even earlier?
>
> Maybe fs_initcall()?
>
> >
> > v5:
> >   - Add blank line before #include <linux/acpi.h> (Bartosz Golaszewski)
> >   - Use scoped_guard(device, gpio_dev) (Bartosz Golaszewski)
> >
> > v4:
> >   - Rebase onto Linus Walleij's tree (patch 1 already there)
> >   - Use --base so series is correctly 1/1 (Andy Shevchenko)
> >   - Add subsys_initcall test results (Mario Limonciello)
> >
> > v3:
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
> >   drivers/i2c/busses/i2c-designware-platdrv.c | 76 ++++++++++++++++++++=
+
> >   1 file changed, 76 insertions(+)
> >
> > base-commit: 3812a9e84265a5cdd90d29fe8d97a023e91fb945
>

