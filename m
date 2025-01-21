Return-Path: <linux-gpio+bounces-14959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 337F1A17901
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 09:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED4621883AAD
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 08:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799181B4156;
	Tue, 21 Jan 2025 08:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jBtbI2iQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED6819F131
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 08:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737446631; cv=none; b=TffzSWdLb7NBYkJJ+fu3Dg7TRJviBzw05Rg8bIXEopfu0AsrCSlkKzsju2EDDiFY/sOLeD7T8Y+T7wyH6v4VQmPePzCykW63DESzoLKmfeMH985j/buMCbRnhpAIxCG82fjJxMd+Ze7U+XT0os6uW1PnVyO8Zl8ZpEkbCiXjBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737446631; c=relaxed/simple;
	bh=N8zx6HqiP0IYCIOJkJv49NyaMCMfUqHrZKQYAY9p22I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dAIAD+fQPhjqtbrcZUQlKmw1DK0KcRU1U+ioaUOoqJrzlkXYiRLC7klkGkPslHLWr3W0UXb9fELC0j4yDeSYzCNgyLnHgxbV5ndToyC9gj7Ga9HlWOyMCT8HKTGN9spCJW8w91+tRgsGA064hTUAwFJUPQPK0SxR0l9O0de40bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jBtbI2iQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so54203345e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 00:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737446628; x=1738051428; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N8zx6HqiP0IYCIOJkJv49NyaMCMfUqHrZKQYAY9p22I=;
        b=jBtbI2iQmWwYxcUXNpWWTaWr9oj9rqGvWSwUBQ8FQVeTZ0whfL+PWgd9V5LNszK1dJ
         VQHrtrJkxaz2qZ1VifJYwUmXv1eVdgOqCgwY5Jz6qsMnsS/KWFKmTLyLaw8vh6I97854
         BfxYfJqp65G5qxhMUzIbyul52mLR0+mcFtvuBcdK1nYHULbJA3FAxqTjnYFGwFPXsv7i
         Qt0/OOoIw7KRhugi4tbPQxv/25ZdgcGCUeguAXcx6l8pNnyQvaH5LH2vV8DvAbcY3Zw7
         C4nnDqdKyO+qQ/GJtqQwHnS5gjNS/0v1HCo8kb2v7w/X6o031o4t1w8SJ+pDCeuGl8ED
         0gSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737446628; x=1738051428;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N8zx6HqiP0IYCIOJkJv49NyaMCMfUqHrZKQYAY9p22I=;
        b=FYm9oeVIizigX1UwOeiDwAaZGsn4YlA54A4SXdV7EPWv9p6duYyWcCTiRaXH78ipQu
         rY7Si8mgtJCOFuvjvMUT2tQSnWgTX/bqidWwtka+yqg+/X73Ks2UyD2C2ETkxRnRXl6N
         G8EGUxmDHah1V7Xh+Gl/DD0GGXtaq7T/41tlN2hKsbamjhIcarQwDgX8VCAk6Dm0ARJV
         nJZMOO+Y9cTsDbRsiQL0fTPqEokL/ge6WGqGeDYmfs4UOzM15rCeiEpMQ5R/FONJsocb
         5ro3vh/eXoFLhDcVdiWi31qIuViNWziqYv7yu0n0iZe4VgmaFpDoMb5DfxCCJu5aU6Ks
         /PVg==
X-Forwarded-Encrypted: i=1; AJvYcCVh1zpOGymxJxlnYW0AtjwLl/NGQPVk/znY/dJyDaiyTKzQ6thao690ht+9qD2Qw4GpjVBA4ZkzdO+F@vger.kernel.org
X-Gm-Message-State: AOJu0YxoYZkvlphFqZYIDdmyj5Ixw2a961Jmm9rMjeRiAr//2DS8Su5a
	+oWGGCIMvr3xe/959QRgxWx/g6nZfvDvNaEWsJOAXmc8X5CRZJoLNqadsRuemQU=
X-Gm-Gg: ASbGncvXdzCVxPZvElY+py6IcgyeSLxx0Qcgo76lvlld0b6azMEMbEvqsaPzCIWHYKI
	YcznfyWInFER8mU9NcHPDe9QP+fCGPdLCQOqJt+yl0XUu0m8H2Nam+gMz5f6hLKybh3iXwP0GRw
	aB+r+mK6wKeKEMU2dDoJVhNFVUWmrJxzgv6YWPVCGmjZtYMD0i/NyoqvkZmeupqU7PLaiCXbO4E
	o+Vd+spWWCGjDnlja8VdPabqoygtnQV96KhcZR+/PQ/+yx6v7lNXxFa5sLNXIjCQGWaXMNTJ8Y=
X-Google-Smtp-Source: AGHT+IHrNBKASCNdy9476OAsuENS8PkN67B0BVHI6CbHYNScLbwyX+0XbsUcr7Ex8YfKUrH7iaH6kQ==
X-Received: by 2002:a5d:64a1:0:b0:385:f44a:a53 with SMTP id ffacd0b85a97d-38bf5655b07mr12484539f8f.4.1737446627668;
        Tue, 21 Jan 2025 00:03:47 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf321508esm12791757f8f.10.2025.01.21.00.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 00:03:47 -0800 (PST)
Message-ID: <09af67d5ab80c6891d546cc74261866999af4433.camel@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: samsung: add support for eint_fltcon_offset
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
  linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org,  kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Tue, 21 Jan 2025 08:03:46 +0000
In-Reply-To: <20250120-pinctrl-fltcon-suspend-v1-1-e77900b2a854@linaro.org>
References: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
	 <20250120-pinctrl-fltcon-suspend-v1-1-e77900b2a854@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-01-20 at 22:34 +0000, Peter Griffin wrote:
> On gs101 SoC the fltcon0 (filter configuration 0) offset
> isn't at a fixed offset like previous SoCs as the fltcon1
> register only exists when there are more than 4 pins in the
> bank.
>=20
> Add a eint_fltcon_offset and new GS101_PIN_BANK_EINT*
> macros that take an additional fltcon_offs variable.
>=20
> This can then be used in suspend/resume callbacks to
> save and restore the fltcon0 and fltcon1 registers.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


