Return-Path: <linux-gpio+bounces-26095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EEEB56071
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Sep 2025 13:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C172483C28
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Sep 2025 11:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18AF32EB869;
	Sat, 13 Sep 2025 11:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THdh2vyh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670B412FF69
	for <linux-gpio@vger.kernel.org>; Sat, 13 Sep 2025 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757761350; cv=none; b=FROe5qPi9zooKU7DLi6P1ooLFeHQPrGTS7KfyHq+tpI6acVsFekuUTx+ZDU071nqgI6RJ5UX/rBxIGssGy/0TujfuQvdd190A94V2Ihhfyf/1XbQDLc9e6NxQqmrjuzo9rE0fp12L6SKndZyzWfPkjC8u5rWqp2Oex/9MZyBBZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757761350; c=relaxed/simple;
	bh=BXHeodyc6oI0LqMSWJ3CeHdCp3CLonWo1Am23e37j80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPvspFmwYH0/64Yh7V4+y38uG+4ujZIi8otqhW2mpOWlnM1B1xZp+G9gbQp9IOEAirRHnsY3ovrMPY8mTldp7H+y4nebzKOEo7+BRrwN8Qw3mhnyCmJh7nTkEb92I2cG5Ae6KfrhkgNt4rIbtNoSzJRFZO3AtcLdNaiufUk3aC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THdh2vyh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24eb713b2dfso23227065ad.0
        for <linux-gpio@vger.kernel.org>; Sat, 13 Sep 2025 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757761349; x=1758366149; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lSHxxUm5MkO+s5BZz5eceu1yg1KflUbRrShjzBDT/G0=;
        b=THdh2vyh3Jtpg3laeiJ84oORXNH7/VgDJ77kVd6Ugetpn3RAsllx+5kgQ+X+1TMvSy
         AkZ4j5jr4PDOKVrKlgCWqdabAtbxFcyDjd46vSn4ojicK2lcOxpczQMB95lhfLR5hDV6
         CySMeL7MPjHZULkL6SD7dk0FxG+zpqbEOmHraI/rtcZH+xPNZYFSd/WpVS31glpuYyrm
         E60FEN8aLs598rPvXM4j1gcZ1gUS8vHDjV9j3SmPSv0KS66B04p6YMvHkmw02PLCPig2
         kqvTyDGk51WDe1LQI28sFig1Pm3qcgqodq2EkG/cnrg3sodYFE63vdBBCi+f/r1tVbcG
         Adgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757761349; x=1758366149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSHxxUm5MkO+s5BZz5eceu1yg1KflUbRrShjzBDT/G0=;
        b=TjbChtgP7jOMwe+sGO3k56rD2HyTsmZmM1dQRC6A0YpBHo/8QoRSnbRvEB2G6OVBkt
         jYOjFD3fI715jjKJe0Ta9MeQGhVPewrYaD/0Q2Jl0tzZNpf3gvQQtKBmHHgMwrLL+oC/
         8LsuWy3SFDJlgCM2CT8dz/0+OXF1mvVKm+4mnDJRIjC1L2eNaYVDQRFz9R8x+CglcOsJ
         mgtSO/PcNElFs6BtfhcoIXxJYzXsEgcJhbNeCvtbvAyACYheNNucZiZr0JI/tDq4JB3X
         Lv/LeJjq08Uf9k7UULR5sPzU/GNEZ6b9UyHejwV6ccKfAc4GrUlfO0NHSBG5C252s04H
         v9kA==
X-Forwarded-Encrypted: i=1; AJvYcCXx2PCNgdjFupwMg85mzN85YwffQTR4JUJ1fkRdjQtRS0O6uCtw2mpI20JgaOZMW5DkUjuOocBK/V2K@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8s4Ay0lqKobcUI1Nd+NmICAgGdlGnuMI2qBRtm5LpBOYB59AB
	4kp5TuUPfFAWld2fywwevNf64rUuk0B6ELa96WjQUs2/3zXHyrBfcrTS
X-Gm-Gg: ASbGnctfzgwTqUxXq5PUNWqyPFIZRgQyS7c6vfa+4F+V5ZWiFIYVvf416Hg0njRUdRp
	gwRYJnPFUbEgmIHiCixM3jPEkYTag9WZxlYSLXc7vbOqOO8SdeoZ/fgFBAICqvX8ZnsAVRBb3Bw
	kztfWVJ+kNU3FuMaJcek93DSDlk2uscqsBP3t3qSGQenFLng4ZoJBFhZqBa3xJVrzkhetbjQRbz
	DYgI2CvGj0KTAxO7eq3unBr6Sz680y+L0t6QpCimUOeTMPSr5HM11gJx9xyjVHoNs/mqVUe56/V
	bqBwKq81PbWEdfdPvINjkIMPYWPL7t0tOE7ffr/89lNNmeUJylZBZUSOePFNQecfpecrL8AqryS
	qzCg7gpKijbpNcEQ83+Ed5P1iHrXslzzf3b6UJiyGhupryw==
X-Google-Smtp-Source: AGHT+IE4JTVtkLqMLoiz8/TSrmFSmKr5Hr/jEFds8tWyqz0lknQdtFDueUAIhY8b3MH0shhwJn12bw==
X-Received: by 2002:a17:902:e807:b0:252:8cc1:84a3 with SMTP id d9443c01a7336-25d26e484f0mr71857785ad.43.1757761348521;
        Sat, 13 Sep 2025 04:02:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b305054sm74144345ad.133.2025.09.13.04.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 04:02:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 13 Sep 2025 04:02:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <0ce54816-2f00-4682-8fde-182950c500b9@roeck-us.net>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
 <20250903-ltc4283-support-v2-2-6bce091510bf@analog.com>
 <742fe9b5-bc53-45f2-a5f1-d086a0c9dd1c@roeck-us.net>
 <0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com>

On Fri, Sep 12, 2025 at 03:00:22PM +0100, Nuno Sá wrote:
...
> 
> i2cdump -y -r 0x41-0x79 1 0x15 w
>      0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
> 40:      b004 0000 b00c a03e a03e a03e 2501
> 48: 0000 1a03 e07f e07f f07f e07f e07f e07f
> 50: e07f e07f e07f e07f e07f e07f 0000 0000
> 58: 0000 7002 7002 7002 b07e b07e b07e a030
> 60: 9030 a030 0000 0000 802f 1000 1000 f0ff
> 68: a004 a004 0014 a004 a004 c004 0000 0000
> 70: 0000 0000 0000 0000 0000 0000 0000 0000
> 78: 0000 0000
> 
Thanks - this should do. Note that I am traveling and will be away from my
systems until September 25, so I'll only be able to look into this further
after I am back.

Guenter

