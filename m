Return-Path: <linux-gpio+bounces-25666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B36B45402
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 12:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1AE717EFBE
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 10:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D219029DB6A;
	Fri,  5 Sep 2025 10:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqFbO57f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA8A285056;
	Fri,  5 Sep 2025 10:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757066548; cv=none; b=u3DUd55nLbTKi1Dd2jCsH10Oz/hslwjFl54WIam1OK78ZvYRFo/AHKvtcw642nGxi2RHHazJ0J0ru9L6JQTJIlH3EwkhyQeXTnMvxzh2Q95ra4mCCMYd69beZxrEnONP6aWr8Yk+r7o9PwOCOJT8X6dSgvdU3hf53lmcooGP9h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757066548; c=relaxed/simple;
	bh=xFCuwgje1x8qSnyx94AW6aELEqq8okLrf2QkUF9jwFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9KP+ECqxZSNGW48kIMQVsWpnceow8TVmcED0h1sCO0wiq22ouiXuY4GlvNZuRbBI2vlPfQwJfudGC8CWXPaPpBELJi3DdEPy7KuCS7/7WWcJsE/TjUQt5Mg5WG6wZvXrTIMg9s7bC41UWOKzYQuLKBpEssWg5bkOgVY/WQpm4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqFbO57f; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7724cacc32bso1567675b3a.0;
        Fri, 05 Sep 2025 03:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757066546; x=1757671346; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mlJOYlx/z1k0Vlh+9uQQpTUfAOydkzaaPUhFUkrjdUk=;
        b=MqFbO57fvzS/Rea9CCiRD273XNrJWKUPl2+wSN7nhmblTikZfIPBkmChAL12TB15UH
         j/hqCtq+068yGC2sGGZf6nFn+4u5Sz9qWHjVknqykiwJ/ip2dFl6LuuvrpngmqYFcywT
         QxGDeGPJ6vMSb8TKIdFWa+5w1V9+0nvHrKYBGr3M8WyZAXTqV9aiT1ikYNIChz4kVXJa
         8QPHFQY8LfYso9dVvq22P89s6aXOqE+HtaAcirSXC0gJQzhyO3fqA6jyGsRg4edjFkSx
         y/UHY8XhEHN4hEJSDKV4cjEe1YZO6usFy4+0dabfXM9GaKojvXy6xESWPB4owwAXIiME
         zjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757066546; x=1757671346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlJOYlx/z1k0Vlh+9uQQpTUfAOydkzaaPUhFUkrjdUk=;
        b=Yp8V2oRr0w1TadIsQ/cwosK4GLfFvr17hMTbT2WVHT7ZSQGmVydWBdQuwY1sER74vS
         0CU3UptUVRq3VvjquF31o28nNGqp0DafciK1hNqI5myEbD23O1FCJPhPZxdPs+ulL/CR
         DUfUSIeQ5iqDl3bqd7Wb9yexSy7Gh6886TFgbzBRlRi2+b8PHJrCJGKeQV5ibsZ8bveG
         8nJ0yYXLCLbe97kdCKRgRwiLcpd8lEauXTBcBQtonHnjqGw6QbWzE6P3iQsZFRNg5aJg
         xQjPk76zMtUUTnwzBYA53IN9Ikib5arIho9qCdpD/KNTZuiy1KlkujEF8TPmrLjwcNbe
         +0hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDwf9UEdK6SbDxZAPlEmtP8tJis3pYgcC1ofBv3Pk4soVBkebysQrcIF4nkD/w/JYhYOrtZoo7kQcY@vger.kernel.org, AJvYcCUHrg6HI1mHKkx3gwOeqPfe1t1SuAucy70lFICHH6JEcqLfRIO8r9Re9QRoBXQiYgJf8cSxCnrjJJl5@vger.kernel.org, AJvYcCV/paQgfyO3vvlnvbUtkXn5fnnWUaY8U3HqSS7akqiUL8VyFcUvBOFfy0AOzebSsz1e5zNWy4GaksxiFWo=@vger.kernel.org, AJvYcCVp1m0mGwXhKYN971/GNMGEyPRCPLGwYb5T3ImM4vwoucu3W5BTXNiu5maB4Vt6/XFxj2ffy3Gn@vger.kernel.org, AJvYcCVqk8xjlmRD5qniTA7b3e12JCuImN7Bx2PU6WKJh4cgQAyG6x8KQbZfu90m8tJd/R+/JAET0wYFKbztdJ0=@vger.kernel.org, AJvYcCWcwn17Qzg3x8yi2ngxU7x82cFF+1Ugt7zSS3wIMT+2pqg8ywfyWYlhAYZmrJeIY+1IVbIG7f8T65hkbLY=@vger.kernel.org, AJvYcCXTLACp3knCLvaIkAbHI3901imd2AIpdlYYnQPyQrX3y8guzGPJfPtoCCOfS0TQjlDCdY1XHfRPUqY+8Q==@vger.kernel.org, AJvYcCXYUXW5AK0CLl9E4V/tzPvUcEeC9OjtuPLCKlzPYSyzXsSfsGmqOodCFR31/ztdmjQeUzmsPYaZu79cGpdP@vger.kernel.org
X-Gm-Message-State: AOJu0YyNJOEDI15f08hJqXRBQ0UFvukJcS3RPdWy5Rpr4stFG0zDErcF
	eAsO1x/z04SsrejW7LYL/RmrMlxNHyYEdLI05VeWtIdQYKOzCr6f115a
X-Gm-Gg: ASbGncuV3JaDHwmHENl8AWioH2b9sdqIgYTVBN5MVCMC8n8xX4InxPyxcNGew2I/9mX
	tNA3KEJpkn3QQUxiotUBxds0PobbKJUamiVCf4z9E+n/K1hq9l/XjBMtzYu7p0bQeF5UjT7zhPa
	3rjBSWSrQCr+URurEdzFkIV4cDJYJINJ62qcBwM6XQEZ/oqZni96I6TfGB5b86K0ErPhlasis/1
	cZmK4v8932eF+FhlcJ5rTZqFp+YmXdJqe7o6CkWu8Dgm0iIltboFCFRPQivDi/6e/JxnoSb5hQc
	czdQE0tyIPMLg095DksxN88UFIeaEkHnVoF6lCrFVBgIbBLXScZbkQyI77fLgGEe2dXPqbvdEpu
	qA3baCzBJ4XZFBBTg3LaCGOk=
X-Google-Smtp-Source: AGHT+IEZFsGwp0kL92yq64dCob62/5/Te5BujmP7PaehTnILj7OwdceaDPf5lu2ogbouVgnk8eNmNg==
X-Received: by 2002:a05:6a00:b47:b0:772:51f6:3518 with SMTP id d2e1a72fcca58-77251f65041mr25029357b3a.14.1757066546096;
        Fri, 05 Sep 2025 03:02:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5133:5770:79e8:362b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a269e9csm21898326b3a.17.2025.09.05.03.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 03:02:25 -0700 (PDT)
Date: Fri, 5 Sep 2025 03:02:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, 
	airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org, davem@davemloft.net, 
	edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com, 
	jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org, 
	kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, 
	mchehab@kernel.org, minghsiu.tsai@mediatek.com, mripard@kernel.org, 
	p.zabel@pengutronix.de, pabeni@redhat.com, robh@kernel.org, sean.wang@kernel.org, 
	simona@ffwll.ch, support.opensource@diasemi.com, tiffany.lin@mediatek.com, 
	tzimmermann@suse.de, yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
Message-ID: <caguo7ud4dapb4yupeq2x4ocwoh4dt5nedwjsyuqsaratugcgz@ozajhsqwfzq6>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
 <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com>

On Thu, Aug 21, 2025 at 01:56:24PM +0200, Linus Walleij wrote:
> Hi Ariel,
> 
> thanks for your patch!
> 
> On Wed, Aug 20, 2025 at 7:17 PM Ariel D'Alessandro
> <ariel.dalessandro@collabora.com> wrote:
> 
> > +  ce-gpios:
> > +    description: GPIO connected to the CE (chip enable) pin of the chip
> > +    maxItems: 1
> 
> Mention that this should always have the flag GPIO_ACTIVE_HIGH
> as this is required by the hardware.
> 
> Unfortunately we have no YAML syntax for enforcing flags :/

Theoretically there can be an inverter on the line, so from the AP point
of view the line is active low while from the peripheral POV the pin is
active high... 

Thanks.

-- 
Dmitry

