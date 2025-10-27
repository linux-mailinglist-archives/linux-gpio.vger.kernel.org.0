Return-Path: <linux-gpio+bounces-27654-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79722C0D45E
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 12:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E690419A6EA7
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 11:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D573002A0;
	Mon, 27 Oct 2025 11:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hz/nCLCj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D522FFFA1
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 11:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565662; cv=none; b=IpxMXoY6bvKdOJP/01e8eIwLfo9nn/KXG/InZkDsJ6u7MhBy10Zqk1UJ/soES0xZJqUdv7Mix+XejBntXjpyklZfhg5eD++7JsZ9g71cTGSFV3WK3Ld8K5fzZVtaxb9/NRWVLAQ6mO8bZOWvVNWa+Bgf6qQiZYAIc9QpPlM451k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565662; c=relaxed/simple;
	bh=gjeT9bDglpMQa+8nRsoJxSuRqqUVmizcoxLrAXmV8+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzM1x2z9fq9ojq1lPdMCeWyfefNynwpYOo0AyPUnHGaKvvDPJ2wdDUTO0+3GvWUvBH1a1DSJVb7NcM9aLDmnAMziSilepPJ7Se/+/ErN2p+PpsxNZcGIuXp2TKwMf5g0SMyyUowBeuVF13JH56TxCZqN15msd8o2tFmmeC1pVXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hz/nCLCj; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b6d5b756284so962411266b.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761565659; x=1762170459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3dA7DNOvN9+GRkIwpdijEck/U9WrX/wU0vswNS4MOK8=;
        b=hz/nCLCjb8cVkDdBsvQmfsVsf1H0QNjKHupBZireRSXDaaWw8RL4gxhNjF7d6MiE28
         QejjwBORYRjPUBS+IXODV8F3goVSl5MH25pRS6DOURubAxfW5+vTvudiR1CWVSaG3bmA
         avuZerX6U5tlvGNURadmzeJ8LjzGeffTemyGjX8pNunAjFaPrPoBQ5GDRaV0rUIlrHzc
         PKLf1vDuxM99xS9Y2bvjvkY5tgmrnoaoRJND/thFJ7yf8Y3sGjX6HzrqX+y4HRxRjd17
         5umJQGXfvR8ECGRVfsyFSb5M+R558LAC5De86WDWEkLSOY1iH2/hpdQFLdM9k4TQkBU/
         19iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565659; x=1762170459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3dA7DNOvN9+GRkIwpdijEck/U9WrX/wU0vswNS4MOK8=;
        b=Q1zsPaXQfwDqX5Osh7PH2trLnuA7HYaHccEGbLVOpX572RjcIgJS3DkO0XWjQKPRR0
         W97GV+7gE1ce/2ZRDIWP2dbQe0vPzJTH9aK16owkwFvjhGROhTPXhhwilrEsYLq0P946
         epGOBpLJZBNuAb35ZEE2c4ZOynX8hQ9TEunTgDMvrm9kQgrXm9XUYXi1BZpKN/UNd1pq
         OF4y+QF8/pTcX370DXECdvqhUSZqipzkuf2SxGRBiMe46oxRZrW0sDYBbsIO5jAZoMeZ
         ADIjEPV3dZPIWiwlO8KNe2nuhsYFYSxgeb5mFEPk0MafU54FxB9arXxmD3ue5n5K0tbn
         7aIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH5dUFA/A0dmciSIbx94HNivQaoKW6I2a3q6SrDIh4sjEgBqBsf8uOqtccGZk3bGEZAoyocEyBygzz@vger.kernel.org
X-Gm-Message-State: AOJu0YxgU/zNCCzZ9Xv08P3ummaNebFdaTBa3dBtWO4pJOloTVu8q3lz
	U6T4rr2Lm1SrZlCcFaskBBNU0A49h16CEqoRSX6NGb8XD6d1zQzqQJdL
X-Gm-Gg: ASbGncsSCvNEtEjYnnDHjfAluF7rL0Ux0gbwu3GwFAmzEY7Q8HR9xkHSQca0+Ic1Fwb
	tENXYGDPuA0QMbg7go2zHH8qR9WCBhyDs0r+Uqzy48BdhUmY/KD7nIxm9vQJi9ujFUvMprpIpyS
	kbiy2+6Serl4JHf8RpeHjlLhMbgQ7dpDQMRoQ42vSVtztG2KbMlhicvJseqbuuVG4hdsc0QZFQR
	EIO9o9UV1E4SaxZ820bzjIuRexNMKboWkE1PPdEdYArXeWVxLH+EAJFUdZJxP1B0hJMqvbKL/UK
	z+zzxBuTd/KMzwzCzw2zZW2+eHdWmuv7977TGXiKqerRiRh+8NOM2voC4bzvJ6aC/k9mNkO66ic
	nVWpUEffSJ3ON9yMUEfRErx/nrQ8EsUcEuM6QAki8jmcFzxP2NW8yqx10jv31Z+jq5u7QkRe9gl
	BbhpSwykDv75YBXziSDkkIXubWtZy/h6rcOAcwg4gfW68Pm6SesDAt8a1sWQDos4X1oEkAw06XL
	d+NMAOMdfFc8g==
X-Google-Smtp-Source: AGHT+IFy8Sej3CcOEkpdvrCVde08UILRMDmtaKTdqCDrNYAJ47XcANLENt/DJ4RukrNXPpjXNZXRqA==
X-Received: by 2002:a17:906:9c82:b0:b38:6689:b9fe with SMTP id a640c23a62f3a-b6471d45a01mr4021916866b.7.1761565658699;
        Mon, 27 Oct 2025 04:47:38 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f10f:3501:4457:58fa:e678:17cf? ([2001:9e8:f10f:3501:4457:58fa:e678:17cf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853c5bd8sm737774466b.38.2025.10.27.04.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 04:47:38 -0700 (PDT)
Message-ID: <70574ef0-6518-4320-b6f2-dee9e01b2cab@gmail.com>
Date: Mon, 27 Oct 2025 12:47:37 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-line-mux controller
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-gpio@vger.kernel.org
References: <20251026231754.2368904-1-jelonek.jonas@gmail.com>
 <20251026231754.2368904-2-jelonek.jonas@gmail.com>
 <176156516117.3074175.12049051744005094692.robh@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <176156516117.3074175.12049051744005094692.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 27.10.25 12:39, Rob Herring (Arm) wrote:
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml: gpio-line-mux-states: missing type definition
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/gpio-line-mux.example.dtb: gpio-mux (gpio-mux): $nodename:0: 'gpio-mux' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> 	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/gpio-line-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): gpio-line-mux-states:0: 0 is not of type 'string'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/gpio-line-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): gpio-line-mux-states:1: 1 is not of type 'string'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/gpio-line-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): gpio-line-mux-states:2: 3 is not of type 'string'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/gpio-line-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): mux-controls: [[1]] is not of type 'object'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/gpio-line-mux.example.dtb: sfp-p1 (sff,sfp): 'i2c-bus' is a required property
> 	from schema $id: http://devicetree.org/schemas/net/sff,sfp.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mux/gpio-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): gpio-line-mux-states:0: 0 is not of type 'string'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mux/gpio-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): gpio-line-mux-states:1: 1 is not of type 'string'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mux/gpio-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): gpio-line-mux-states:2: 2 is not of type 'string'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mux/gpio-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): mux-controls: [[2]] is not of type 'object'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mux/gpio-mux.example.dtb: sfp-p0 (sff,sfp): 'i2c-bus' is a required property
> 	from schema $id: http://devicetree.org/schemas/net/sff,sfp.yaml
>
sorry for these silly errors, I'll fix them in the next iteration.

Best,
Jonas

