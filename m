Return-Path: <linux-gpio+bounces-26653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A27BA8661
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 10:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB805175FBC
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 08:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C2023183F;
	Mon, 29 Sep 2025 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mjDyHHh3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C2C21B918
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759134654; cv=none; b=llgsXK/MCNvot1wtIKrRtBqyIxQJ0QqeSbqSflOdYVTfvoL6hh1MXXoYFBs1cC7OcqhFHHm23P0Q34FrY8dNU1NnnWQw9muZYFVGsNPXNiXtcnHJZ6IeQh7E0iuv2SH4ji/5We8DNznPzWDTlLuO+KQWQdW7t5vfjMlUBYbdIOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759134654; c=relaxed/simple;
	bh=1yWrEi955nPPvBu1m9KwQaY5HyLcEXUxbZckZNeDmWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbFuxyrOk+e7JrmFmFAqjkkrSEFUeVMhs9CYhpkXR8ZCtdjlLSVyyYeGnZgGOiCiZgqFqazh+8P3Bkv+9dXZ3m3hsgGYcPIFCXlNiMLPi7YOi3Cw8jxChka0tWY4XunrkueaETr9NlLJCsa7yI05ZSBWOCAbz9Mfh+JbUq9TVmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mjDyHHh3; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57d93a4b5e5so5024164e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 01:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759134650; x=1759739450; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UJONDUXJa/G+AY4kgKaGSYPSvsqZ+MAfDWA2lmXRRpc=;
        b=mjDyHHh3ZjL4lSx9j24O1CtVr8O7VrJ6GjzBSEoqocKxiLulZc/wSAzuwVTV74Ry9g
         vxfuz0XGDcerzFquNQSBJcS47g2ZE7wT+IfYS54hkpyzR5P88TbrT65WHnoMcm+b/cVD
         HM+oUq/iYypI7s7RzSpi/Oi9SB8dN4YLvaKXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759134650; x=1759739450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJONDUXJa/G+AY4kgKaGSYPSvsqZ+MAfDWA2lmXRRpc=;
        b=YWOBUxalBVyZPagSIuGG7EaFr1Z6UBi2i2L6AYCov1KPAJ3qRf8irOqknfU8fe5at9
         vLbgZUfDeriHxrmUT0XSTpOQxQvFIKW1vw3joIKtigmrM2KN0HLM9ih1aii8Se3OyesL
         ICGVqFCMqEFgSuee8Wo2uQYWpxA78R3sVpeUFq0FRXq7sB+ZKsGDNYhknUi2AfEzC1lE
         0czVh2QEYneL0i0f4Fzd05JDxIHbM1FOh9Vi28dcynhP3j+9UEQnCwSo8z+TjFbLY8Mc
         Ukd00Me4YyfIxJzGqWvbwk2LwMnD3ctDfdytyQUDdJDj0ri/l2HFw00o2dH+Bp3eP7mq
         3UCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5da29W1sqVrnxJFyEcWzV1P1JnfNq51Dl0JEdc6ckli9hc2tEII+w3Q1r8GLs0hjJmWCsB6sbkLDr@vger.kernel.org
X-Gm-Message-State: AOJu0YyFuvFrVVOlGbJ+pD8S1LpEF7Pr/CLdEYt2aiaChiloRpXXrvzg
	GGM/JII5ggJIV3lnYomzjfiRdSgd6rds1DFQAb8hGTs64ZfzQtgeIztfUJXXx1QcrlHzXNl9gAX
	Lmqc=
X-Gm-Gg: ASbGncu84p4VS3zpePrUtNuYQXnhpBgcOsYCM+LH4BkOpTsjU7mi1+BlUy8CMN88dTL
	VH05wiWKKjn2KKO+I1IhNVlbEIttu7gPur4e0xcIgh4LIE3wZic3gzD07J/s1QfAK3xZMskoeks
	WqHasyULE62MTTC6ZbnxS/V2ksW0sPXekD8T4caOFn48p0K/Ub6+owL3BfN9AFE8lm4T/pjOzSe
	rmI4AcFS/LYXSMZuepfo6OX2O8CnJkR617/soQCGhUSzw5fM1f8nrWXLMI8bmtS0mGRY5QwkeUy
	JssLS4y0KWCkq9SH+foijTnwtV/RLROnrHuzTADNsxn11kd1UPiJVYwZjwwRdIVkB7tRdhjIsS+
	3W5mqpNLXjQFM/WtgC+sMW7UFLeosW7L7tE4GVlv7/NPvwbWjfhsiqdFqsljC
X-Google-Smtp-Source: AGHT+IFiSw4JNiFTVLgp6JSIQYxlkQdEq6oyceWDjqi7zBSiE0opIJgecpE9iEjLmYA7CcFrMdo1WA==
X-Received: by 2002:a05:6512:2c8f:b0:55f:64b9:3ab4 with SMTP id 2adb3069b0e04-582d2299c9cmr5015379e87.23.1759134649955;
        Mon, 29 Sep 2025 01:30:49 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-586755289dfsm1464331e87.80.2025.09.29.01.30.48
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 01:30:48 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57d93a4b5e5so5024119e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 01:30:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXcmTyvNf+BC54+1SDL2ZUGwTeCdUZuk36OW7QIbImRSh4/eylI5wQLb3u4U9bSgrPkSvBZiO5R9x+Y@vger.kernel.org
X-Received: by 2002:a05:6512:1102:b0:57c:2474:3740 with SMTP id
 2adb3069b0e04-582d3f76e30mr4820322e87.46.1759134647732; Mon, 29 Sep 2025
 01:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
 <20250926-uvc-orientation-v3-7-6dc2fa5b4220@chromium.org> <20250926-mute-boil-e75839753526@spud>
In-Reply-To: <20250926-mute-boil-e75839753526@spud>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Sep 2025 10:30:35 +0200
X-Gmail-Original-Message-ID: <CANiDSCuddqjeDr80xKsZZP7CXu9qB5qqYPoZujNYLcVjK0kKkg@mail.gmail.com>
X-Gm-Features: AS18NWDuABHOrlsFlY-rDCN1sMikoapkz5ecsd4Y1lKthbQuEsgF6GxQRq0htYQ
Message-ID: <CANiDSCuddqjeDr80xKsZZP7CXu9qB5qqYPoZujNYLcVjK0kKkg@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] dt-bindings: media: Add usb-camera-module
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Conor

On Fri, 26 Sept 2025 at 18:55, Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Sep 26, 2025 at 01:11:31PM +0000, Ricardo Ribalda wrote:
> > For fixed cameras modules the OS needs to know where they are mounted.
> > This information is used to determine if images need to be rotated or
> > not.
> >
> > ACPI has a property for this purpose, which is parsed by
> > acpi_get_physical_device_location():
> > https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device
> >
> > In DT we have similar properties for video-interface-devices called
> > orientation and rotation:
> > Documentation/devicetree/bindings/media/video-interface-devices.yaml
> >
> > Add a new schema that combines usb/usb-device.yaml and
> > media/video-interface-devices.yaml
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  .../bindings/media/usb-camera-module.yaml          | 46 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  2 files changed, 47 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/usb-camera-module.yaml b/Documentation/devicetree/bindings/media/usb-camera-module.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e4ad6f557b9151751522e49b72ae6584deb0c7ba
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/usb-camera-module.yaml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/usb-camera-module.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: USB Camera Module
> > +
> > +maintainers:
> > +  - Ricardo Ribalda <ribalda@chromium.org>
> > +
> > +description: |
> > +  This schema allows for annotating auxiliary information for fixed camera
> > +  modules. This information enables the system to determine if incoming frames
> > +  require rotation, mirroring, or other transformations. It also describes the
> > +  module's relationship with other hardware elements, such as flash LEDs or
> > +  Voice Coil Motors (VCMs).
> > +
> > +allOf:
> > +  - $ref: /schemas/usb/usb-device.yaml#
> > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > +
> > +properties:
> > +  reg:
> > +    maxItems: 1
> > +
>
> What actually causes this schema to be applied? Did I miss it getting
> included somewhere?

I guess your question is why I have not defined the compatible field?

I tried this change[1] with no luck:
/usr/local/google/home/ribalda/work/linux/Documentation/devicetree/bindings/media/uvc-camera.example.dtb:
device@1 (uvc-camera): compatible: ['uvc-camera'] does not contain
items matching the given schema

I think it failed, because If we add these allOfs as Rob proposed
https://lore.kernel.org/all/20250625185608.GA2010256-robh@kernel.org/:
```
allOf:
  - $ref: /schemas/usb/usb-device.yaml#
  - $ref: /schemas/media/video-interface-devices.yaml#
```
We cannot (or I do not know how to) have a different compatible than
the one from usb-device.yaml


Any suggestion on how to do this properly will be highly appreciated :)

Thanks!



[1]

@@ -21,10 +21,14 @@ allOf:
   - $ref: /schemas/media/video-interface-devices.yaml#

 properties:
+  compatible:
+    const: uvc-camera
+
   reg:
     maxItems: 1

 required:
+  - compatible
   - reg

 additionalProperties: true
@@ -38,8 +42,8 @@ examples:
         #size-cells = <0>;

         device@1 {
-            compatible = "usb123,4567";
+           compatible = "uvc-camera";
             reg = <2>;
             orientation = <0>;
             rotation = <90>;
         };

>
> > +required:
> > +  - reg
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    usb@11270000 {
> > +        reg = <0x11270000 0x1000>;
> > +        interrupts = <0x0 0x4e 0x0>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        device@1 {
> > +            compatible = "usb123,4567";
> > +            reg = <2>;
> > +            orientation = <0>;
> > +            rotation = <90>;
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ee8cb2db483f6a5e96b62b6f2edd05b1427b69f5..1503502a3aed2625e8ff488456ccd7305cc74ba7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26258,6 +26258,7 @@ L:    linux-media@vger.kernel.org
> >  S:   Maintained
> >  W:   http://www.ideasonboard.org/uvc/
> >  T:   git git://linuxtv.org/media.git
> > +F:   Documentation/devicetree/bindings/media/usb-camera-module.yaml
> >  F:   Documentation/userspace-api/media/drivers/uvcvideo.rst
> >  F:   Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> >  F:   Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> >
> > --
> > 2.51.0.536.g15c5d4f767-goog
> >



--
Ricardo Ribalda

