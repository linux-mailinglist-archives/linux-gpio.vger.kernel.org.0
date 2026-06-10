Return-Path: <linux-gpio+bounces-38284-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jyspG9m7KWr9cQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38284-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 21:32:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEDA66C83D
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 21:32:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Z6fowfpM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38284-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38284-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3F4B302CD1E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 19:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B9E361641;
	Wed, 10 Jun 2026 19:32:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE9D32B105
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 19:32:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781119957; cv=pass; b=cLwffkliHYNG/y7LjnVv29BRWu1TiMqywkUm7Q/vTBHFdoObJT6LYzz7N7L1biPeRv6ZPyjcFBzV90VVnAinhmCfbig4HuH4k63YFLrSlfts3TMQ+UfMgeI/vzM4QZ8XHB30Boe8yCQ3s4nZRZSu6UpsN5y/oIhmO8/74dXfqbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781119957; c=relaxed/simple;
	bh=yw4QQiR2BjNKk1Xh/n7ZzdpxWwXGfRSGZ/a9t2e1ars=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=A/0WG88qfXpYwlKTVgeSkoHRiJjLkswzthhJ3OUmcicGoeda2JPycfV5FtDVXGFc/sg4uPGJuB2NBl30I1xtfJ9knQ/5pu4MkYNbqf3QzJ5ddTyGTL/WWKwuQTF4F/xFahHEf8MMQTTNHjwIL5+QyZ3k6y+a7fD3WgNB33xjMhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6fowfpM; arc=pass smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c379e8ffso49649615ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 12:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781119955; cv=none;
        d=google.com; s=arc-20240605;
        b=fjwsbV3p12XRobYUUU/N0r1oPMW5yO8nrQFw77mWps8N2scv2hNKg2OOcuadKG91u6
         KAsWcnSzI+YmDiUvFaSFGQpOdtbxEF1gu/VXLqi98f8XtsHnf0sNK1xIPmi8mrBSgNq2
         iMicxoxrELXm/lsfonl7A5UIqyNBL2zjsqWauYdmMmcX3xPYrdufR44D7IMkamNY1N6w
         8VbfvOeC03NQ0N1WszbLYIQmb0CVdGrAhiXnoDzmVExLU0K+BtI7a/J0a1lhAtQiJ1BM
         DG74wLD2AYAb+n/VYkLOxiiUy+Kw7mMtfeRwsO/pymEnmpxY3gqciAV0wkjPuTPdrk71
         a6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=yw4QQiR2BjNKk1Xh/n7ZzdpxWwXGfRSGZ/a9t2e1ars=;
        fh=jmwIWj/x4TDKl0q/DGyuz56jOJNKuEQOxfCz82U2eQQ=;
        b=Te3jTLgOzWPbhX2eEw39BpeiEpfWqyMVpktwuFBNIb2yX3bO0lYzUbDcMUvPjNammF
         GV6Ipe/MLQnIl6NoAPYpE+mTjwYcx96r5WllBBMfbMc6KP8zbF3qpIL2aUE3z1MP/AKq
         BcIdeXOACAzAhFnG2dRLD/zoyBnqWOqQxPZKnTkxMrut3AfhHhJtw+fWd7NrCXvHp3hk
         hiHb/xz8+3yrZThZTzR0IpooBdjvYWvQ1evWAJUdTFTDZwjLaET/zALsN4wBIrxnzc8L
         h73D9xcRdZykzcIZYGTUnuRtMeoLue6xHRS1EWKuRSXm0023IkcQX5avyFA2pw47kEp0
         7gFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781119955; x=1781724755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yw4QQiR2BjNKk1Xh/n7ZzdpxWwXGfRSGZ/a9t2e1ars=;
        b=Z6fowfpM1mnQBJopS/+44NmH4PpJIrXNcxKUyt3FznCGMCcWKrqUosMxlTe3fDdPt/
         GSfIYbq/QKeedIyttdfq3s4pYP/oiWeRgla7edzK+0WvzLG/+DZ/fCQeTORFnBEe7Q+1
         qaAyh1R1l13d/sIFBR4O/JQHuNteascChhyJFY/zJSkHRcNwynV4XNe6aGj2cNmkKHCr
         FkC5F+1gfLOVRpAN+isH5gL7abJp8OhTr95U+9FWz9AWKwfsW4dTeES79tRY+vy45iqm
         S0KBLvOxDFQI4+JEg70lJsZGRBG/0r6UFDiGMStRpxlvACBDKWXkefq2XpFffs8Kwho0
         7Ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781119955; x=1781724755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yw4QQiR2BjNKk1Xh/n7ZzdpxWwXGfRSGZ/a9t2e1ars=;
        b=BBLzJ/73RvCanLeXxIA6rIueloZSGE5jg2dGBDSmaGW2nu4nx3hpNKo82nrKZd8XVy
         Ui8E7TxIzTrsSs5vAEOcGU0uIGbx6tmYf4eJmBy8q/856QHg59JUZAt5d+tKSr8huqO3
         CLycZgRuJTIDalklfg19RkO9BYbqf6o149ZVKXS3/zXdVFh+EtSUiZoLpK+bqPn+qL8g
         hO9y7/NMT3GmzfhazvfSKywKn+p5MIcE10ecFkBcavNSVgHaRG0BbHNxIbG5X5W3L1hP
         8uU6C0awuV6tTl+hUmrr6ZVy0l1hSDD0N0IG+xi2FdBnAAA2eQCqgmFoJIQMbcPQnmV9
         7jFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/gOE8DOrHoFR+zXwFvsto0Y/uFXYehe7+3Xsf7uXc75ZGmZiFL7zdrJdIP3DZq9CTMYTTUzDQxWG2@vger.kernel.org
X-Gm-Message-State: AOJu0YzZZBQwT+ghg9Q+VsHu+MbGCWMBXDEPqd1nd2tnJ2nN0A4HnMKo
	Hu1i/pK1uTcbx4xI6KXVgdcPcwV+y1nfbBNlgOhtvys+z1Hq/Dc8DjEssrghwcfnxyIVlDmliwN
	7Ud96EDK63aOJcRol8qYcB1V7yV+keaWWlzy3
X-Gm-Gg: Acq92OFvcWCdn3E3f5khxToHzBFFXElhWUkfn5lofbdnDR8fN0i/U2TrrWzUc7H7t59
	Xi+Qharr9uKsVyO3i/i9byYTAkiigoQJApm4a5Nm1A4drIZ7j+Ztu3Mqr//ppuHOHz37FquhrF4
	d9H3roxWr8DE2ODK3gnHd7hiKWmEHEHJCsbTpHFDJnX9f7Xn4L5v+focWqdXSzkKwZeGUm1nXMM
	kqySaE+hgG9cvIZhdrFFfTZ5u7Z9kHgTI4+Jl7jA9qon25/8+jBe/c+KdKVybhbVi+4aDfWNp07
	vGhlbUoH2LEuT9nZj1V6mGJ2HQsceUV58cchx/svhox9RMw6p6Qrd8kgoadHeW+68IQ5FHaIRKl
	n023827y7cXjT9twsSTWwU3WIoKnw/9yVhOOWxIcuIXI57g==
X-Received: by 2002:a17:903:1813:b0:2c0:c262:b919 with SMTP id
 d9443c01a7336-2c1e78e4e97mr177445565ad.5.1781119955351; Wed, 10 Jun 2026
 12:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lenart Kos <koslenart@gmail.com>
Date: Wed, 10 Jun 2026 21:32:22 +0200
X-Gm-Features: AVVi8CckacFZHS5PZVju8CNzuQgqAd6nCYOpcgzhfIxMNlSkxtXD9ZnJXCv75SA
Message-ID: <CAFdvZNt+mRTE9Q+utn=T8GzU7s_09ULhUtzTMMa9dgGCsE+r9A@mail.gmail.com>
Subject: pinctrl: amd: spurious immediate resume from S3/s2idle via BIOS-armed
 wake GPIO with no ACPI owner (Lenovo Legion Pro 5 16ARX8)
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Linus Walleij <linusw@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38284-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Basavaraj.Natikar@amd.com,m:Shyam-sundar.S-k@amd.com,m:linusw@kernel.org,m:mario.limonciello@amd.com,m:linux-gpio@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[koslenart@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[koslenart@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,fedoraproject.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBEDA66C83D

## Summary

On the Lenovo Legion Pro 5 16ARX8, suspending (S3 *or* s2idle) with an exte=
rnal
display connected resumes the machine after ~1 second. The wake is delivere=
d by
the AMD GPIO controller (`pinctrl_amd`, IRQ 7) from GPIO pin **#4**
(and pin #2 for
the USB=E2=80=91C/DP path), which the **BIOS has armed as an S0i3/S3 wake
source directly
in the FCH GPIO register**, with **no ACPI description**
(`_AEI`/`GpioInt`/`_PRW`)
anywhere in the DSDT or the 16 SSDTs. Because there is no ACPI owner,
none of the
existing override mechanisms (`gpiolib_acpi.ignore_wake=3D`, device
`power/wakeup`)
can reach it, and `IO_STRICT_DEVMEM` blocks any userspace register
write. The pin
is an external=E2=80=91display HPD line, so the edge produced while the GPU
powers down on
the way into sleep immediately wakes the system.

## Affected system

```
DMI sys_vendor LENOVO
DMI product_name 82WM
DMI product_version Legion Pro 5 16ARX8
DMI board_name LNVNB161216
BIOS LPCN62WW (2025-06-17) # latest available; does NOT fix this
SoC AMD Ryzen 7 7745HX (Raphael), GPIO ctrl AMDI0030 @ 0xFED81500
GPU NVIDIA RTX 4060 Mobile (HDMI) + AMD Raphael iGPU (USB-C DP)
Kernel 6.17+ through 7.0.x (reproduced on Fedora 43/44)
```

## Symptom / evidence

Failed-suspend kernel log (verbose PM):
```
PM: suspend entry (deep)
...
amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #2 during suspend.
amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #4 during suspend.
amd_gpio AMDI0030:00: ... Disabling GPIO #89 interrupt for suspend. #
not a wake src
ACPI: PM: Preparing to enter system sleep state S3
Timekeeping suspended for 1.384 seconds
PM: Triggering wakeup from IRQ 7 # IRQ 7 =3D pinctrl_amd
...
GPIO 4 is active: 0x30057c00 # bit 14 (WAKE_CNTRL_S3) + bit 29 (wake latche=
d)
```
`/sys/power/pm_wakeup_irq` =3D `7`.

`/sys/kernel/debug/gpio` (relevant rows) shows pins #2 and #4 armed for S0i=
3+S3
wake with their interrupt enabled, while #89 has no wake bits:
```
#2 =F0=9F=98=9B| =E2=86=93 | edge |=E2=8F=B0|=E2=8F=B0| | | ... 0x147ae0
#4 =F0=9F=98=9B| b | edge |=E2=8F=B0|=E2=8F=B0| | | ... 0x57ce0 <- both-edg=
e HPD, S0i3+S3 wake set
#89 =F0=9F=98=9B| =E2=86=93 | level| | | | | ... 0x151b00 <- no wake bits (=
red herring)
```

## Root cause

1. The external=E2=80=91display HPD lines are routed to SoC GPIO #2 (USB=E2=
=80=91C/DP) and #4
(HDMI/dGPU).
2. The BIOS sets `WAKE_CNTRL_S0I3`/`WAKE_CNTRL_S3` (bits 13/14) on
those pins in the
FCH GPIO register block and **never describes them in ACPI** =E2=80=94 deco=
mpiling the
DSDT and all 16 SSDTs yields **zero** `GpioInt`/`GpioIo`/`_AEI` resources.
3. `pinctrl_amd` correctly preserves hardware-armed wake pins across
suspend, so the
HPD edge generated during the suspend transition wakes the system immediate=
ly.

This is effectively an unvalidated firmware S3 path (the platform ships as
Modern-Standby-only); but note **both** the S0i3 and S3 wake bits are set, =
so
s2idle is affected too.

## Why existing mechanisms don't help

- `/proc/acpi/wakeup`, PCI/ACPI `power/wakeup` =E2=80=94 wrong layer; this =
is
not a PCIe PME.
Disabling wakeup on the GPP bridges / GPU has no effect (verified).
- `gpiolib_acpi.ignore_wake=3D` / `ignore_interrupt=3D` =E2=80=94 only matc=
h
**ACPI-declared**
GPIO events; this pin has no ACPI declaration, so they cannot target it.
- `/dev/mem` register write =E2=80=94 blocked by `CONFIG_IO_STRICT_DEVMEM=
=3Dy`
(the region is
claimed by pinctrl_amd).

There is currently **no way, in-tree, to disarm a bare (non-ACPI) firmware-=
armed
pinctrl-amd wake pin.** That is the gap.

## Suggested fix (maintainers' choice)

A working out-of-tree reference implementation (clears bits 13/14/15
on pins #2/#4
at probe and on `PM_SUSPEND_PREPARE`) is here:
**https://github.com/Lenart12/legion-nowake** =E2=80=94 please feel free to=
 reuse.

Possible in-tree directions:
1. **DMI-matched quirk in `pinctrl-amd`** that clears the S-state
wake-enable bits
for the affected pins at probe (smallest change; precedent exists for AMD G=
PIO
wake quirks).
2. **A generic override** for bare pins, e.g. a
`pinctrl_amd.ignore_wake=3D<pin,...>`
module parameter, analogous to `gpiolib_acpi.ignore_wake=3D` but for
hardware-armed
pins without ACPI events. This would help the broader class of AMD laptops =
that
hit firmware-armed spurious wakes.

## Reproduction

1. AMD laptop where a display HPD is wired to a GPIO the BIOS arms for wake=
.
2. Connect an external monitor, `systemctl suspend`.
3. Observe resume after ~1s; `pm_wakeup_irq` =3D the `pinctrl_amd` IRQ;
the offending
pin shows `wake latched` in the post-resume `GPIO N is active` log.

## Public discussion / full diagnostics

Fedora Discussion (complete diagnostic walkthrough, ACPI dumps, gpio table)=
:
https://discussion.fedoraproject.org/t/immediate-wake-from-s3-sleep-when-hd=
mi-is-connected-irq-7-pinctrl-amd

## Attachments to include when filing

- `acpidump` output (or note: DSDT + all SSDTs contain no GpioInt/_AEI).
- Full verbose-PM `dmesg` of one failed suspend (`pm_debug_messages=3D1`).
- `sudo cat /sys/kernel/debug/gpio`.
- `cat /sys/class/dmi/id/{sys_vendor,product_name,product_version,board_nam=
e,bios_version}`.

