Return-Path: <linux-gpio+bounces-26738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ACDBB1910
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 21:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C11A4C390C
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 19:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D1D2D7810;
	Wed,  1 Oct 2025 19:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UO/2YdTR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CCC17A305
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 19:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759345601; cv=none; b=NUj8RS8ntEKQAtbL47k2hK6L7U2PAQk2cEySMVjdiyCDqPS6yx/ChcnMMUt8ge+LPi+W/zMqVDk+tGw3TLcy9mvtSQnMdr9BrNsnMz//OyVJuINAWvDC/CULZK51oWyNGynQGcZ7IfHYCwFJ6WzuaDYbA/8Qz1X/6DGiRNtTDro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759345601; c=relaxed/simple;
	bh=/7uFq056iE+/b/Ir+0Cr1OjZjng+VJ83X+iaLMe841U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OA/c5C0MAymyfyLPLK0P2ILbRXj84K0RpxHMKSTBbM8Xv2lzswGIpmMAbJceK804NKYUiaO8lT3ikVmpDm7fbx+ePoiPB1bm3y9Gsrji9GjN9jul5ikRtfcZ+0O3jN/LZ1YfVxkpNHe+D5X1tM7iWRAalfW/QSVE3CSohRn38GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UO/2YdTR; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b2e0513433bso39394766b.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 12:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1759345598; x=1759950398; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r1S8KRUqgAG1UODGHd0wi24X7As4LcyI2/rQbjVggMQ=;
        b=UO/2YdTRvR2l9AJNjH2EkEEmrB31UHW5Z9TGuXc2+FPt7EHqIgbFNy6w92bGJK6qJ6
         QYT3jbgGHGtElEz61whd3+Hgi5SAZ5J6Ulz/SQSijeFxOKtM9UPhag93zJ8ZQtxomMvs
         bAw/PpsjzibG+bBj9KNPb9dd42/zULrVbJaiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759345598; x=1759950398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1S8KRUqgAG1UODGHd0wi24X7As4LcyI2/rQbjVggMQ=;
        b=fJnSy8a3UkBECLxDRuDW0gKKdADQiXhGsn8rnVLuoNwTzfHlU2t/SzDaTGW25hCjhl
         HA8YzCzJrIvys/N6aLlMaAqLhFwvZm7VNcMsLwgZ4jicBBEDLAQLlJlFWL+Wv5jl70WJ
         nH336H17CpW5iYV9D4BpXdg8celNu9vlgqsTy/AjHD7xZ9plGDMN2aBpDMXbqS/IcuO5
         b5hsEU9hgyqsoEZGjSA8UvIWWCVYMFMLFPYQPVzFjKKt0KDYhYi0OMlQqdy9XZp89Z2u
         5NFD3dr/HNawTIhn1n3YRttQCjfdvfzDZRBr3OxmfVbrqR2aRDrST0RfGYlHDhVOna2D
         vHNw==
X-Forwarded-Encrypted: i=1; AJvYcCVu5kdJaVHfnMkV8CSJCPjHO//89HCw5g06eVuBZlkqPr7PiRc68dBoZHd2ZaTPezJtQ/uzU9XwJSrd@vger.kernel.org
X-Gm-Message-State: AOJu0YwdaFJDqk0SbymcFnab54arA7FlyMlZurmQ30Uek64ItM5oSEDk
	c52sVuIut7zaZ+StC56FRtnvV3SMVM9qsQfac7sNlzGmJ4UY3d+0OqxZn8QGBfPdtx7KeocHIIv
	0Gg256cg=
X-Gm-Gg: ASbGncuQkK+HbUbdjcnFdoWFZq+HDomEkAJERxjKDNVezAgar/Wyh/Y/+E0IsyYTi96
	MumKgVFMOe1GBlap0Ly9BP+yZigTpr9XXHpm1BW00SJKhZFbaxZSsYcqCds5W0f2hNfJMkbScvV
	g94bl1fzGTL0FBWffiLMD5jzkMClBJ0DMR1podbhZOAY7a3Nz/33q5IMuTrR/ISn57dlujhg4FV
	v2lHUcAfS0RENdoGhOiksbSxDyae8eYvmTwH82MwGEarzY0Zo46qUOv6ff4vhxeTCtOegpD2R3p
	KMBqRbU3dlPSlrdeU6UD919ZEnk7gDMQ68er5zHIjxRI/5LolDwURbwTtC9JGv1XulhbK+xPYi7
	isdGy3BHsMF0ZUdfphjF2/p4JxrxlcLlz7nm+Zbk2me3lJ86cPai4zKKeEWbrmE4ISTpzAdxEKB
	1gxeig7T0G6/VPw+jXZakK
X-Google-Smtp-Source: AGHT+IGKdIRXO7b3/5r3ZksaqrfvaYr49UHS+i3vc3fx+TnWZR1wX7RXgGzjUwLR10LNkuoWQ9yr9g==
X-Received: by 2002:a17:906:c107:b0:b29:c2ae:78f8 with SMTP id a640c23a62f3a-b46e9573028mr592390766b.46.1759345597594;
        Wed, 01 Oct 2025 12:06:37 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a178659sm24538466b.99.2025.10.01.12.06.36
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 12:06:36 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b07d4d24d09so42528566b.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 12:06:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLGwMshElpXoPxKXTWfjbF5nRManitRXC3y7vGmMILKA1sS3ZjOQW+wTjYf35iTj8GsQOy/H6cqq22@vger.kernel.org
X-Received: by 2002:a17:906:6a0c:b0:b3f:3efc:35d5 with SMTP id
 a640c23a62f3a-b46e585d400mr560815366b.15.1759345596314; Wed, 01 Oct 2025
 12:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929094107.34633-1-brgl@bgdev.pl> <CAHk-=whnmvjsan9Y=LcV0encJungD451VkdqYAKrRpk6YyA6-w@mail.gmail.com>
In-Reply-To: <CAHk-=whnmvjsan9Y=LcV0encJungD451VkdqYAKrRpk6YyA6-w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 1 Oct 2025 12:06:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=whPqa8YnjjH=Np_Q8r+9xDrypJVL4SPtFzgN-Znjb6knA@mail.gmail.com>
X-Gm-Features: AS18NWBQbwNSzGagnRky8eufGxCzgJDwgghbWOSeBBuByz1r-HbMKjsahJtuBw0
Message-ID: <CAHk-=whPqa8YnjjH=Np_Q8r+9xDrypJVL4SPtFzgN-Znjb6knA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio updates for v6.18-rc1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Oct 2025 at 11:36, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> It's trivial to fix, but I should not be in the situation where I have
> to fix it, and I should not be getting pull requests that don't even
> build under trivial configurations.

I see that it got fixed in the MFD tree, but this is not how things
should work. At all.

                   Linus

