Return-Path: <linux-gpio+bounces-39141-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nwv7Or2AQmra8gkAu9opvQ
	(envelope-from <linux-gpio+bounces-39141-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:27:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A35B6DC054
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:27:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=n33VHGyN;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39141-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39141-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 685C23285268
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 14:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E9D416D0C;
	Mon, 29 Jun 2026 14:15:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED69416D07
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 14:15:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742549; cv=pass; b=ABq3ztVmO3wEDN7FqXHSvQrge3Rxp4OznEcqix4NvpNI63/oeiLvtzfx6ASRO9MC60HZeDlEOdtqR+NA/SxKEuSKksk6IzACAKe2hV6/qyAz1MnNCB5CSOJBOICduBUYOE0aZk812DOpsbISqlmhPze/dt3oXiP+BK07xok4MDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742549; c=relaxed/simple;
	bh=OtZHlosSQyn1xZEj4FbD20xEl2Zg6R/HhfdZz9XIx8g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=IkGaIhDsPfR5+vO3acXsJXZwx5OGERWGGILU2AcaX3HQoEENpu88Dqh8zOwcd+AfP5XBSAucvcFVfiZ5e1glg7h3JXol2AdRD6VpJ6ajUqVkO+E24X9SMliM6Rqkvl/7cSyNv9unSteKjJxj/05Hcd9fIj6k+0hSp41MFNt9GSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n33VHGyN; arc=pass smtp.client-ip=209.85.167.54
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeba1a36dfso755690e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 07:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782742546; cv=none;
        d=google.com; s=arc-20260327;
        b=KQ2UrvfC2prw3Wt+LQ5TMVhJv6hTYL+ZsMqg3qRzzEbnN4I9+7Me83kXWRH3lAygQA
         Te2wtOhEU1XCJXn1zpCqCNIyy3YdUWisEXVR5kSVjKW0oqlplV3wJEc1g4uPn3RW3prC
         T30CwBpvVfkFZqXRMvHIaYK5RVeKyIUDG4vW03fxGHcUxuAmurL4q8m/mGMS4dNyq798
         bnPZwfaDIdpVlzuUOdRa52P2RDg60yuNSN2fgFgR4bdHzv9nacnklWFDtqwubDd/rEXN
         K1NVe0YkIjylRVcIeOosp9f5bfXkAxFnU40pYXmjbf2X8ZR90hvWLZNw9fkFW+Dr2VQc
         Mftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=59kKtSnZyepLfYP5fS5VCom4sURma9Duve+AdYcsFp8=;
        fh=HDkShzcwcUv4/8nGr+YN9Pi2aMRMpgnlDWuMS+gKw/w=;
        b=C/hsDKEaHN/9rZMJPerHfAhBzutK9TSQAPS2yqVLCBzUuW4lcKEk+DUGBj0pywhhuT
         hWsNe68TaFDYKxHszcG1U9mpXTX/GLjRrJ2hVeqDWKRcnNWvDpevBAHfb6/DSvsl+PZ5
         3Sv2/c4YMx4Mh3grpdIBqDQaF+iRCODHY4Pt3WgIZwZQ1j3gg4AxcGwybJvsZmvx+COX
         4g1NVUit3M3kgdHfNGgm/HMs4czO9XD6MWFvPdUkwQASALWiZTLx9byKUymTGE1sznbx
         UKcKOZSC+ijiDpgw7Z1XU5wAfX0hsqKRPDnJFLO00Ha1w5ZC0si+Cry0BSXoOM+gBoXA
         GvWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782742546; x=1783347346; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=59kKtSnZyepLfYP5fS5VCom4sURma9Duve+AdYcsFp8=;
        b=n33VHGyNRhhg6V2ukiHyuylPTj0yF2chSqR4UrQLU+PcO9DBVZRMJYw2HvrYxJFCXn
         Ols/xxQvAqk9M7nazKiG4RDLbGHkbTilyq3uwK6ZVlK+K3cx2IXyIQ1CHLfV41m4Jn/0
         IprzgknbhpYZsM3ypptw/UO8Kfd7T9QX6OW+KQFP8Zi4OY8EpmnVVVbfIZxAJeO/5qe1
         vlFwz94t1OWM/5yeY7MwAnRwwV5wGObQF0MF6uxHfYijcc4ciLjnU8sRpYtqooVqf6ab
         rJrIEHAXlO9jy/1dIxR3BFWSYf8V/01upD3zrBTzZ2bbwB3aSr0qZIz6PMR3cwNTivDi
         cnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742546; x=1783347346;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59kKtSnZyepLfYP5fS5VCom4sURma9Duve+AdYcsFp8=;
        b=OS9HTLhvrURsHv/yPFqK6MOFC0FAVbG3AD20HkYhigKE6Jq0W7hJONkFwD+KWkYG6b
         9dnK08W3BkSuwFr3/41bPuz6Yi6q0s5x45Kuw4rTD2kEu2jGYY/kFSNtDyWs29hY6iLT
         sxS04rdyndR0dUzKaSZM7ioF2cPcfOsnREgs0hhXuW5HDdUij55J5WbLw0q1cxW89d0T
         FdFx5pvYVaRidUtbJca/wz3rucDPqIzaJZD+VFA9/sKT4GyLtNcOIAb9OEsB0DxBE+lT
         hvRq3Scm9QqXG4zz3m5mp9pr4hH39at8Fhlb2G4AeEx7x1C+yI62VEn+PRwm/e03dQBs
         wxMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpG1tb46bPaXLWjuI02LI7RaQ+sxRTe7MUovDm5VBbAP6bz+qREyWC6k6ff/bPHjuW/v2kG9sHrY2Jb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9STA+bfYzqkJErCgr36KmPsiQ5cVwpAKASVp0QuVpQmxBwfSZ
	XIqT8JMDQVVeLRPJRrtUqbhVRZ5wEzwiDKhhTAyqTwYFU6tYFsJprJAlG/Cxcsf144SNoYyUUDH
	WZ3XcJOnqwAiUx4AY4t3lVmtqldCG8cw=
X-Gm-Gg: AfdE7cn5wu5VQC7YEEODHgnvDkcaah6udQR3jTfluvJAcSL0lt860GJzZDPcf6qdCFh
	z9KQMzGsUJl1gZFb9QJC1VbsIggP6IYarT85qdif160boQScgB4P5s/oeoT2OFdxVwou6L3Nj+F
	ktyXlEz8SuR1Kd91nqo2ErBQbnCVVyBJ11kK8/77VdWtIYw0JxiTOjp00QTViR2yZ8L1SE9Qx7J
	YyC42FuDg1unPQSreKMbKa/YyYLyW7V++Aa+a/I4LBY+nxSDKcFOlPsKrWWujDrX3bL6Rmul7mE
	Ck7kN1cLN3xHLDgH3CWpQQuwxEpUdctVZ35Us2ucsG2+TgDlwmk8CzGQ
X-Received: by 2002:a05:6512:2c8c:b0:5ae:b542:434a with SMTP id
 2adb3069b0e04-5aeb5424384mr1370778e87.34.1782742545486; Mon, 29 Jun 2026
 07:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Steve Yang <steveyang137@gmail.com>
Date: Mon, 29 Jun 2026 22:15:33 +0800
X-Gm-Features: AVVi8CesCnwacAYxOkZCQnuvvoq6KByS_Mn3G3IGfj6ATQqqNfAwuGq04hFjbXE
Message-ID: <CAMNbjot1DD9p2rouzQq_SGjuo0L6WpuX215HaNOcWV7TZpueBQ@mail.gmail.com>
Subject: [BUG] I2C HID touchpad BLTP7853:00 347D:7853 enumerates but reports
 no events on MECHREVO XINGYAO Series-P916F-PTL
To: linux-input@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39141-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-input@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[steveyang137@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[steveyang137@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A35B6DC054

Hello,

Resending as plain text; sorry if this is a duplicate. My previous
message was rejected by linux-acpi because Gmail sent a HTML part.

I am seeing a non-working internal I2C HID touchpad on a new MECHREVO
laptop. The device enumerates, binds to i2c_hid_acpi + hid-multitouch,
and userspace sees it as a touchpad, but touching/clicking it produces
no input events. The GPIO interrupt counter also does not increase
while touching the pad.

I am new to kernel debugging, but I have the machine here and can test
patches, ACPI overrides, debug kernels, etc.

Hardware
========

DMI, with serial/UUID intentionally omitted:

  BIOS Vendor: MECHREVO
  BIOS Version: 1.00
  BIOS Release Date: 03/14/2026
  Firmware Revision: 1.48
  EC Firmware Revision: 1.0
  System Manufacturer: MECHREVO
  Product Name: XINGYAO Series
  Family: Panther Lake
  Base Board Product Name: XINGYAO Series-P916F-PTL

Software
========

  Linux archbook 7.0.14-arch1-1 #1 SMP PREEMPT_DYNAMIC Sat, 27 Jun
2026 16:15:10 +0000 x86_64 GNU/Linux
  linux-firmware 20260622-1
  libinput 1.31.3
  hid-tools 0.12
  acpica 20251212

Kernel command line at initial capture time:

  BOOT_IMAGE=/vmlinuz-linux root=UUID=<omitted> rw rootflags=subvol=@
loglevel=3 quiet

Device identification
=====================

/sys/bus/i2c/devices/i2c-BLTP7853:00/uevent:

  DRIVER=i2c_hid_acpi
  MODALIAS=acpi:BLTP7853:PNP0C50:

/sys/bus/hid/devices/0018:347D:7853.0001/uevent:

  DRIVER=hid-multitouch
  HID_ID=0018:0000347D:00007853
  HID_NAME=BLTP7853:00 347D:7853
  HID_PHYS=i2c-BLTP7853:00
  MODALIAS=hid:b0018g0004v0000347Dp00007853

udev for /dev/input/event5:

  DEVNAME=/dev/input/event5
  ID_INPUT=1
  ID_INPUT_TOUCHPAD=1
  ID_INPUT_WIDTH_MM=115
  ID_INPUT_HEIGHT_MM=72
  ID_BUS=i2c
  ID_INTEGRATION=internal
  ID_INPUT_TOUCHPAD_INTEGRATION=internal
  LIBINPUT_DEVICE_GROUP=18/347d/7853:i2c-BLTP7853:00

Symptoms / tests
================

1. dmesg shows the device binding successfully:

  input: BLTP7853:00 347D:7853 Mouse ...
  input: BLTP7853:00 347D:7853 Touchpad ...
  hid-generic 0018:347D:7853.0001: input,hidraw0: I2C HID v1.00 Mouse
[BLTP7853:00 347D:7853] on i2c-BLTP7853:00
  input: BLTP7853:00 347D:7853 Touchpad ...
  hid-multitouch 0018:347D:7853.0001: input,hidraw0: I2C HID v1.00
Mouse [BLTP7853:00 347D:7853] on i2c-BLTP7853:00

2. evtest on /dev/input/event5 shows normal-looking touchpad
capabilities, for example
ABS_X/ABS_Y/ABS_MT_POSITION_X/ABS_MT_POSITION_Y/ABS_MT_SLOT/ABS_MT_TRACKING_ID
and BTN_TOUCH/BTN_LEFT. However, during physical touch/click tests it
prints no events after:

  Testing ... (interrupt to exit)

3. /proc/interrupts has an IRQ for the touchpad in the original ACPI
configuration:

  intel-gpio 18 BLTP7853:00

While physically touching/clicking the touchpad, the counter did not increase.

4. debugfs gpio shows this line as claimed by the touchpad and high:

  gpiochip1: 51 GPIOs, parent: platform/INTC10BC:01, INTC10BC:01:
   gpio-18 ( |TPD0 GpioInt(0) ) in hi IRQ

5. KDE/libinput sees a touchpad-class input device, but the pointer
does not move and clicks do not work.

Things already tried
====================

None of these changed the behavior:

  - acpi_osi=Windows 2021
  - BIOS option named "Enable Windows OSI"
  - unbind/bind i2c-BLTP7853:00 from i2c_hid_acpi
  - echo on > /sys/bus/i2c/devices/i2c-BLTP7853:00/power/control
  - unloading huawei_wmi
  - setting HID feature Inputmode=3 with hid-feature
  - setting HID feature Surface Switch=1 and Button Switch=1

ACPI override experiments
=========================

The kernel supports ACPI table upgrade, and I confirmed the modified
SSDT was loaded each time via dmesg, for example:

  ACPI: Table Upgrade: override [SSDT-XXXXXX-I2C_DEVT]

I tried these changes to the touchpad GpioInt resource:

  original: GpioInt(Level, ActiveLow, ...)
  test 1: GpioInt(Level, ActiveHigh, ...)
  test 2: GpioInt(Edge, ActiveLow, ...)
  test 3: GpioInt(Edge, ActiveHigh, ...)

All three GpioInt variants still resulted in an intel-gpio IRQ for
BLTP7853:00, but the IRQ counter did not increase while
touching/clicking the touchpad.

I also forced _CRS to return the SBFI Interrupt() resource instead of
the SBFG GpioInt() resource. That changed the interrupt to:

  IR-IO-APIC 84-fasteoi BLTP7853:00

but it caused an apparent interrupt storm, with the counter increasing
by thousands over a few seconds, and still no evtest events. So the
Interrupt() path does not look correct either.

ACPI notes
==========

The touchpad ACPI device appears in SSDT under:

  \_SB.PC00.I2C5.TPD0

Relevant decompiled pieces from ssdt18.dsl:

  Scope (\_SB.PC00.I2C5)
  {
      Device (TPD0)
      {
          Name (HID2, Zero)
          ...
          Name (SBFG, ResourceTemplate ()
          {
              GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                  "\\_SB.GPI1", 0x00, ResourceConsumer, ,)
                  { 0x0000 }
          })
          Name (SBFI, ResourceTemplate ()
          {
              Interrupt (ResourceConsumer, Level, ActiveLow,
ExclusiveAndWake, ,, _Y08)
              {
                  0x00000000,
              }
          })
          CreateWordField (SBFB, \_SB.PC00.I2C5.TPD0._Y07._ADR, BADR)
          CreateDWordField (SBFB, \_SB.PC00.I2C5.TPD0._Y07._SPE, SPED)
          CreateWordField (SBFG, 0x17, INT1)
          CreateDWordField (SBFI, \_SB.PC00.I2C5.TPD0._Y08._INT, INT2)

          Method (_INI, 0, NotSerialized)
          {
              INT1 = GNUM (\TPIT)
              INT2 = INUM (\TPIT)
              If ((TPDM == Zero))
              {
                  SHPO (\TPIT, One)
              }
              SGRA (\TPIT, TPDM)
              If ((TPDM == One))
              {
                  SGII (\TPIT, Zero)
                  GRXE (\TPIT, Zero)
              }
              If ((\TPTY == One))
              {
                  _HID = "BLTP7853"
                  HID2 = One
                  BADR = 0x2C
                  SPED = 0x00061A80
                  Return (Zero)
              }
          }

          Name (_HID, "XXXX0000")
          Name (_CID, "PNP0C50")

          Method (_CRS, 0, NotSerialized)
          {
              If ((TPDM == Zero))
              {
                  Return (ConcatenateResTemplate (I2CM (I2CX, BADR,
SPED), SBFG))
              }
              Return (ConcatenateResTemplate (I2CM (I2CX, BADR, SPED), SBFI))
          }
      }
  }

ssdt13.dsl defines the NVS fields used by that code:

  OperationRegion (LCNV, SystemMemory, 0x6FDE4000, 0x0300)
  Field (LCNV, AnyAcc, Lock, Preserve)
  {
      EDID, 4096,
      TPTY, 8,
      TPST, 8,
      TPIT, 32,
      ...
  }

A possibly relevant observation from the same SSDT: under
\_SB.PC00.I2C5, TPD0 seems to use the PXTC power resource, and the
Arg0==0 path in PON() appears to only route/configure IRQ. The Arg0==1
path, apparently for the touch panel PTPL resource, is the one that
toggles TPWR/TRST GPIOs. I have not tested overriding TPD0 to use that
power resource yet.

Question
========

Does this still look like an ACPI GPIO/resource issue, or should I now
focus on an i2c-hid/hid-multitouch quirk or a missing vendor-specific
reset/init sequence for HID 347D:7853?

I have a full debug bundle available, including acpidump, decompiled
SSDTs, dmesg, udev info, evtest output, hid-recorder output,
dmidecode, and /proc/interrupts snapshots. I can provide any specific
files or test patches you want.

Thanks,
Steve

