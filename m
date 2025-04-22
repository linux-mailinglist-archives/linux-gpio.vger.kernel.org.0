Return-Path: <linux-gpio+bounces-19123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B55BA96316
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 10:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCA9D400E1E
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 08:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA575261596;
	Tue, 22 Apr 2025 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ELsMVzXp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63791EB18D
	for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311488; cv=none; b=RPQ2v6TmG7Wm5vDnnYlh/+/xGb1eGnmjz0i6JJK/hgG3G4OvwXA38cmyPregXRFbrYWdPDD59flrqe6bJ++J5zU2AbA3MMzJjHj8flT0SOPwiKLG6tMsDuZ9IdHr0NtJ5Y092RAw8NvPNhqZHNvwKnzpxkfR40Vsftiolq3rFDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311488; c=relaxed/simple;
	bh=P47QWwCm1v9g4MBFhGt7X6yWDzEz0lF1K9o6O8AqT60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCuPpJA+z/lumVuJSVxMThUuHO0QcywD194qbnC6Bu7KSsF8K5/DspcU7iDDXQoESqJHvljuAAHgfzsLUTqaGha04/ZQSRXDVw7CccqWlnxyyk32ipyAshHkj71wdwLjxfWHsAAezjEGl4BV202ZY7ITo3CTq9G33fGO8Ijxpv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ELsMVzXp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745311485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+RdOtqSYZgJN9V7ZhicuRS1n/wY7Pa3OON81X9wpN0=;
	b=ELsMVzXpqJq/sVnyNZPhV+3Go8WJSaOOLnnesGjZ9RSO33Rxg56WZiz+sqIHL7U3Gj7gK8
	R96dE2PNgpbXPS9cvv59LbqmFd0si0bivJR29mIvZ1JmwWzOohkEXt+NdsmnYTi7ceF+Lr
	okvSNw+PMxJ2oe6TJ6kd9I3bzb85FwA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-vAPx6S7gMyuBiDTTKdKHVg-1; Tue, 22 Apr 2025 04:44:44 -0400
X-MC-Unique: vAPx6S7gMyuBiDTTKdKHVg-1
X-Mimecast-MFC-AGG-ID: vAPx6S7gMyuBiDTTKdKHVg_1745311483
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac287f28514so410127066b.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 01:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311483; x=1745916283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+RdOtqSYZgJN9V7ZhicuRS1n/wY7Pa3OON81X9wpN0=;
        b=fl7nvSVu4PufljXrmhWTFMl5VtTeXQOtPRfeopD2LVnXKh7YiIthbDlYy0qU4wveT1
         pK0AlLO4rllFxc3h1/LUHw4CgTJxg5y6biJ/x4RUBVBySqyJo/FKRw6t0OYkkFc7EwXC
         8cHuHNe5aBLzFQhmiOt65+OgXqsCoHoZUW5PDr1+TvNQUNWtJKSvlXnPWFzFZwfS9VDP
         pIoy827Pf2EMHkWDHlEOe8KNB5J05xmplJ3zkoUqE2ZBETSms0+lAgLbwks0woVook7J
         J3QvMBe9uqVHEyqpIJry4tLUU2HKTxzhPBxTY1AflsnMwy4qu0G9GNNEHEwKxwc+yXcY
         N9dA==
X-Forwarded-Encrypted: i=1; AJvYcCX4AshE2waH2Tig8J8JOhJFOdz5gDa+tBQKrIJfl3Gl+eUYPOoDwjr7Rs8eKT6WdEvTVv3e4J4cuEeV@vger.kernel.org
X-Gm-Message-State: AOJu0YysclaR3II0Xpsg3L3SzfVe/A/BfZi19r+W5Vl2CuFUUAPWNNCH
	XMmhrHwUSYSiLf6L5RdsOIv37+5MrhD5hFJfR1ZJFZ9+3fIyiOqlVKw0XXenSMAJ7yVLhudFjey
	DUffX3ooMvXdle1X2HPsCFA9LmTDXQaX6b+uYaB+l/qYzZcxJPRQCPQ9ebMg=
X-Gm-Gg: ASbGncuFYxBl1H9VNC9c87m6JneRUZVPkCdRRkqcQiAg+BkIs4lnARKEH2i/hIXkHtg
	z5FPRrwn6srq2IzZIGpL7MdbD+W2jI7jYQRsk+NxMOq+ASPrUf6E8GE/3oIoYptEHOw8CPGZuGA
	U4AqDopPboOZDt3AsHMOd2jaabTwy4jWVMDIvcPc5wsooreVAFY/HS4bQLh0DwB10ebz1kzpSZK
	mu4L6O84OATo85Q5lJhFiBxWn6qzuYJjUnO7AeCEXumLsjZJGUuxn9EAOKQrgwTRshZv+EaNHSG
	8DqWA5hd18o3cGe4VYALCbD+5efqdmAKiagmNzEpP3uECb9DZRA1Rsv5qF2mW7rGzH7Jv1bJM19
	FFXD9nus0yucY+9Czjrp73jjE8e9xdOCDVDXCaNEsWBddFIKrjjAltqXinZ3EZg==
X-Received: by 2002:a17:906:5048:b0:acb:8aa6:5455 with SMTP id a640c23a62f3a-acb8aa666bbmr673103066b.19.1745311482864;
        Tue, 22 Apr 2025 01:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpgdWV71E14QWV9s59BE4ul4PG5ma83tK012XEEsIaRAbQGVP1sxKldI3T51XJVDSQc/mtRQ==
X-Received: by 2002:a17:906:5048:b0:acb:8aa6:5455 with SMTP id a640c23a62f3a-acb8aa666bbmr673100066b.19.1745311482404;
        Tue, 22 Apr 2025 01:44:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec5160csm635268866b.63.2025.04.22.01.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:44:41 -0700 (PDT)
Message-ID: <dd471b51-333b-4537-ac58-29ad2a10f1e2@redhat.com>
Date: Tue, 22 Apr 2025 10:44:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: v4l: fwnode: Support acpi devices for
 v4l2_fwnode_device_parse
To: Ricardo Ribalda <ribalda@chromium.org>, Sakari Ailus <sakari.ailus@iki.fi>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-3-1a0cc595a62d@chromium.org>
 <Z_uIyEe4uU_BC5aY@valkosipuli.retiisi.eu>
 <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ricardo,

On 22-Apr-25 2:23 AM, Ricardo Ribalda wrote:
> Hi Sakari
> 
> On Sun, 13 Apr 2025 at 17:50, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>>
>> Hi Ricardo,
>>
>> Thanks for the patch.
>>
>> On Thu, Apr 03, 2025 at 07:16:14PM +0000, Ricardo Ribalda wrote:
>>> This patch modifies v4l2_fwnode_device_parse() to support ACPI devices.
>>>
>>> We initially add support only for orientation via the ACPI _PLD method.
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  drivers/media/v4l2-core/v4l2-fwnode.c | 58 +++++++++++++++++++++++++++++++----
>>>  1 file changed, 52 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
>>> index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..81563c36b6436bb61e1c96f2a5ede3fa9d64dab3 100644
>>> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
>>> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
>>> @@ -15,6 +15,7 @@
>>>   * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
>>>   */
>>>  #include <linux/acpi.h>
>>> +#include <acpi/acpi_bus.h>
>>>  #include <linux/kernel.h>
>>>  #include <linux/mm.h>
>>>  #include <linux/module.h>
>>> @@ -807,16 +808,47 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
>>>  }
>>>  EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
>>>
>>> -int v4l2_fwnode_device_parse(struct device *dev,
>>> -                          struct v4l2_fwnode_device_properties *props)
>>> +static int v4l2_fwnode_device_parse_acpi(struct device *dev,
>>> +                                      struct v4l2_fwnode_device_properties *props)
>>> +{
>>> +     struct acpi_pld_info *pld;
>>> +     int ret = 0;
>>> +
>>> +     if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
>>> +             dev_dbg(dev, "acpi _PLD call failed\n");
>>> +             return 0;
>>> +     }
>>
>> You could have software nodes in an ACPI system as well as DT-aligned
>> properties. They're not the primary means to convey this information still.
>>
>> How about returning e.g. -ENODATA here if _PLD doesn't exist for the device
>> and then proceeding to parse properties as in DT?
> 
> Do you mean that there can be devices with ACPI handles that can also
> have DT properties?

Yes it is possible to embed DT properties in ACPI, but I don't
think that is really applicable here.

But we also have secondary software-fwnodes which are used
extensively on x86 to set device-properties on devices by
platform code to deal with ACPI tables sometimes having
incomplete information.

For example atm _PLD is already being parsed in:

drivers/media/pci/intel/ipu-bridge.c and that is then used to add
a standard "orientation" device-property on the sensor device.

This is actually something which I guess we can drop once your
patches are in, since those should then do the same in a more
generic manner.

> What shall we do if _PLD contradicts the DT property? What takes precedence?

As for priorities, at east for rotation it seems that we are going
to need some quirks, I already have a few Dell laptops where it seems
that the sensor is upside down and parsing the rotation field in
the IPU6 specific SSDB ACPI package does not yield a 180° rotation,
so we are going to need some quirks.

I expect these quirks to live in the bridge code, while your helper
will be called from sensor drivers, so in order to allow quirks to
override things, I think that first the "orientation" device-property
should be checked (which the ACPI glue code we have can set before
the sensor driver binds) and only then should _PLD be checked.

IOW _PLD should be seen as the fallback, because ACPI tables are
often a copy and paste job so it can very well contain wrong info
copy-pasted from some example ACPI code or from another hw model.

Regards,

Hans



