Return-Path: <linux-gpio+bounces-18244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5D8A7C4EE
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 22:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E77F5189F3E9
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 20:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1729F21E098;
	Fri,  4 Apr 2025 20:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BpegDKBt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E881F416A
	for <linux-gpio@vger.kernel.org>; Fri,  4 Apr 2025 20:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743798690; cv=none; b=PaNyCF2eR610aTeyLh+gl6+49DjdQip1zQw8DX1ncqa2LXRK/BpDdicsNNP7wOJJ4yUTDGprGZ6P7acLSV03qnRTmCYkl6biG2Le2xIPoFWEyVdHNCt7UEBed+C3K3pt6E0s1wou3eekEi3SJ51JQKi5AtlM/J8ZP3xYrS+VB44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743798690; c=relaxed/simple;
	bh=K+GdwcY2qpId+FVrrOCPmblpwWNGwzjXOxhMwE/cWk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XS3+9DW654ipMxupg+9j1lEzIsunWPkcBy/cjexm3K3y6X0mLnQeYEDK64PcIRbK7a3DOf4Y3mJTPsHAQoy0bQjFA7n3e9rXow0jMdObC734eUih+4fpk/r+jyneqHURiOQYImpBeLZ06uBFGcw9F0hVwsZW14h7jaQJc1nr4DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BpegDKBt; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so19505191fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Apr 2025 13:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743798687; x=1744403487; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IJt1e+3GaxJCHQhJ/qyD9KJwcLWIhx1/tmMP/uk1paM=;
        b=BpegDKBtUvmMIDHI2V9LL1TsQ1ZgZBVYVrml0LwKEOeWFgCkvfneHAFe72JRNkpl5f
         jrOWwx2rCD3uP6675+OWJf5n2nKaafD6LBXVCRYNAjuz9Q7goakdJg7NSVGBg/nzcJZC
         0O3ogYgO+nXUwKzHGw8bIfxUEj5/BlEv337hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743798687; x=1744403487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJt1e+3GaxJCHQhJ/qyD9KJwcLWIhx1/tmMP/uk1paM=;
        b=kzEveyx/NbHaSOT4rymXZDZTwpqrXtj57iDGxoFtCYl7obQUJh6uO+xHTbTiyJ/HpJ
         njj54pz9/Ez10QjY0bx1u80yE5BQQDiAwt6xuMpA+CcKqU1UQkWK5HPccEr+g/CSuMZS
         sAwKPw5a7nDTSphhldXzWCdVNFPZje29PijmMDVf1sM9XjUaovBmQYc3oshYpJN8G94o
         vPC4faWWX3ml8iVJpKyUngAspwHBAv3pKOq9SYzbBe/yL8KZqcuGUoSDAmDT2Qi/QqH/
         BR6Wz7GvxZNltTloqq/OdzJTJIHpSw8dJ950x7m/uO+zp03IkLXUDaFV5Ss9hDyqxzr4
         MNaw==
X-Forwarded-Encrypted: i=1; AJvYcCVFu11o7TVRIv6CsPCV/bPpepOw3rrOQteY8LVtHgFnNSCQe0XYiCOzSKNsaU2HpMUTia9F2NMnelZI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5xJsJq7yNkNvIEb57G0TiYLLhcbPRKX3jN/PD7Hc6QdFOojiW
	RLkHcaGMNgQ87fXqF9XGFtxE+1gjIDAF8PjAKXXPzurwNCmc+kV9L5wsDSg6PgGv2fGB20L1lhM
	=
X-Gm-Gg: ASbGnctTNqobD4cAcPDwm7kVMTPAJeoUHeUHdfcGK7B08MpW8YB1xwjSPirH2Sb14A0
	2SwNpudwlKzGasu3vYin0tLNHx6FJNEpjmL0OGQCyq1/WwT0VkkxlXjSimsptwaXW3fS3Zgp+4B
	Nq7zZ3UvS4b+i1xfCBUnMFeMurvWPRELbLf/T+VwmvzpIzkdLTZxLX6BeSYmrn0D+708ZY2B9UF
	awJy4hdPLnmJmlllz/I6gGBfa3wLaiQJkb5arKQqAJ+rcO5bzsqbogJWDc2mbKIzuWU4Lk5wxFA
	MdcmauljnnXMjy6K4JZkVRRfQv+ljuG4PyriPAkjKdKqpaW/Ut8tPv7ife6pqAY8HXnUTmI707b
	VZmAlAj33ahI=
X-Google-Smtp-Source: AGHT+IHOdytT3j+qh+61hOwRo3ec4gzNZ5SWRwXnZo/i2xJAEOF2blYqV4+Fnj3Dxs0kWB8YEqJ+5A==
X-Received: by 2002:a05:651c:1463:b0:30b:fd28:a771 with SMTP id 38308e7fff4ca-30f0bc5ac3cmr14908991fa.0.1743798686984;
        Fri, 04 Apr 2025 13:31:26 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0313f737sm6605661fa.30.2025.04.04.13.31.25
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:31:26 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bd21f887aso19567151fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Apr 2025 13:31:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMYJs2oIo1qmsAoxBWg0Eb4iL0zjcCbto40cfvGbQhHH4V3vIhSieErBDlazomEdvuaA92yoqLIBfS@vger.kernel.org
X-Received: by 2002:a05:651c:1581:b0:30d:7c12:5725 with SMTP id
 38308e7fff4ca-30f0c064658mr16422321fa.33.1743798685456; Fri, 04 Apr 2025
 13:31:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-5-1a0cc595a62d@chromium.org> <20250404193655.GA158858-robh@kernel.org>
In-Reply-To: <20250404193655.GA158858-robh@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 4 Apr 2025 22:31:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCuD=vR7xT41sdyHU4Sci+q27_5cEYUsAOT3jmHBMOfixA@mail.gmail.com>
X-Gm-Features: ATxdqUGWjyuS5jbxrI5_afZO8VPXlqKA2MK8tNbiaf5xCWtDa_Llt0RuBZ7yskM
Message-ID: <CANiDSCuD=vR7xT41sdyHU4Sci+q27_5cEYUsAOT3jmHBMOfixA@mail.gmail.com>
Subject: Re: [PATCH 5/8] dt-bindings: usb: usb-device: Add orientation
To: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob

On Fri, 4 Apr 2025 at 21:36, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Apr 03, 2025 at 07:16:16PM +0000, Ricardo Ribalda wrote:
> > For some devices, such as cameras, the OS needs to know where they are
> > mounted.
>
> Do you have a usecase that's not a camera?

I personally do not have other use cases, but I suspect that it could
be useful for more people.

The original proposal was more generic and "inspired" in _PLD:
https://lore.kernel.org/linux-devicetree/20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org/

You suggested using the camera's orientation.


>
> >
> > ACPI has a property for this purpose, which is parsed by
> > acpi_get_physical_device_location():
> > https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device
> >
> > In DT we have similar property for video-interface-devices called
> > orientation:
> > Documentation/devicetree/bindings/media/video-interface-devices.yaml
> >
> > Add a new property orientation for usb-devices that matches the already
> > existing orientation property of video-interface-devices.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-device.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > index da890ee60ce6e71a11910c565b6f805470782e4f..bbcda28ec7d5695307efa797f57180044afda77f 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
>
> This is a binding for *all* USB devices. This property should only be
> added for devices where it makes sense.

Can you provide some examples of how I can do this?


>
> > @@ -42,6 +42,10 @@ properties:
> >        port to which this device is attached. The range is 1-255.
> >      maxItems: 1
> >
> > +  orientation:
> > +    description: If present, specifies the orientation of the usb device.
> > +    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation
>
> Reference the schema from the top level and drop
> '/properties/orientation'.
>
> What about 'rotation'? Seems like you'd want that too.

At this moment I do not have a usecase for that. But sure, once I need
it I will add it the same way.

In the last thread I proposed Sakari to use:

+      image-sensor:
+        description: Video interface properties associated to USB cameras,
+          typically UVC compliant.
+        allOf:
+          - $ref: /schemas/media/video-interface-devices.yaml#
+

But he preferred to add orientation instead. Either ways work for me.


>
> > +
> >    "#address-cells":
> >      description: should be 1 for hub nodes with device nodes,
> >        should be 2 for device nodes with interface nodes.
> > @@ -101,6 +105,7 @@ examples:
> >          device@2 {
> >              compatible = "usb123,4567";
> >              reg = <2>;
> > +            orientation = <0>;
> >          };
> >
> >          device@3 {
> >
> > --
> > 2.49.0.504.g3bcea36a83-goog
> >



-- 
Ricardo Ribalda

