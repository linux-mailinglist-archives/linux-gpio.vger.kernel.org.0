Return-Path: <linux-gpio+bounces-8585-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F556947911
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 12:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC3E81F220D2
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 10:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DA4153803;
	Mon,  5 Aug 2024 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pfZ/0ZM9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325831448D8
	for <linux-gpio@vger.kernel.org>; Mon,  5 Aug 2024 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722852462; cv=none; b=Fo7iRdvO5y72Niaenoqh6ryDTfQCZOxdgw31Ho8vaOq/VX+WeCoivavMpIcBsnxGhNKTdlRIC0V1sWgOtUbr0mzunhRd3lvvlGw4YH1nvmNySrJkdG/RjRRyNRZ7nycwkSCnYjqnnl7HebWI77MCpzNISMhpVrj3d0shDI6hJf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722852462; c=relaxed/simple;
	bh=dCrQwHuNu4Yr2gqLBFVRcOOAoONxJwFXXQHAvrE1sEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emCevjVSjC8/UmkMXYMmVe02vG0ZCetbLjySq0P38VyoGmkBeHYDcKiTPEnOeEdavEmu614oWyCDYncxAlnDTa+gls9sKgxcDc1P7fzIXu+0FTZShqWkW3QQS7OipqZKIg6FDVAPI4LQDgPUrVNfPiJnUHvYR3pe1Bzo5THu17k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pfZ/0ZM9; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7ac449a0e6so796865166b.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2024 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722852458; x=1723457258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nrzBEV9TKJZGL9w7C8QLUQDF+fjT3Z0R6wFg6fs5vPw=;
        b=pfZ/0ZM9PzBFdfTIr5c3Tl8Z4kaiDopX/QAaqYhbI47TcF7WspP01RtBBi9Uj38OiR
         KJyvCeJ4KtRNh4p+xPdPO+iB7Pr52q4nTVXz1n+Rd686npwzYS3t5/IVhdiMG4vlU/N5
         EEKWmyt1jSJEnx/cBEFgcb9nZGz/P/TAVmRX5tVxd12dLKqNNjuAhzHhgZtZArtoJj2K
         hXiOEZtvrLxyWqNsE4wEBT1QYvkgbW8Ju8uTCCZZntZNoljtDUOjPTLBBsSwJ9LH3o1I
         Q5d4nI59qZywC7omdfyZBodEWiszpExpt/EN898HENJ1+rue4jSsXuORbyBt/MhJTo/A
         0uEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722852458; x=1723457258;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrzBEV9TKJZGL9w7C8QLUQDF+fjT3Z0R6wFg6fs5vPw=;
        b=Mgx4b9+iLZ3dCbuB8MJdAPKKtYxBQaGJWJvO9E0nxaOXgREh3hT+oFdiqucUJ0M8S/
         dnuOK5fqXJsazoka2KWSXR/XrRiXOgLVFRMV4EW0EtNfrkSFJGtcbpQdadDJaE3W/37w
         vFVQfbkIGT3u1pZSRtLkK75QpaqBtqBjZp4eFUcabazIjf6IfHRXwAIkVNr4T2+UKZLy
         zE/MJ5+XIxMxMLiECsYZzArrXjBsaVbLHdnoTkMO+dBMI/MzRwP5pRjjvI97h2pgc4aQ
         mIsft9r/E3g7PX09aOVK/xVWD+Y1fBNa2E3sugmczI8eSrR3TlrOPfm+Hbi9p9B5XhnK
         55cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBU++P9pR4fUnXaMht3nP6sXN7PUbQRHqz4TS++0V9NMIO7fyzXu7GO+5iLn0c3LO/pkNJnfmkFqX9VgYcVfPG31wxulNX2rygFg==
X-Gm-Message-State: AOJu0YwIqBVyYzxv7pInpdyrZIKmHjEVIdcpgYuAMxs2I+ETdjwU/UHn
	1JvlGh9ZuTTyyD2h3x8ZMKYSybDuBEr/2O3rk4cjIhX52WyKZt9SGroloDwzKEM=
X-Google-Smtp-Source: AGHT+IG3V1BOG7TCKsOTvhtQkh0arfmX9lcI3/tvaTS5Vqkv8eDVwgGwXRVpu1baD+2O3bGi6blasw==
X-Received: by 2002:a17:907:6e86:b0:a72:8d2f:859c with SMTP id a640c23a62f3a-a7dc4fd88fbmr775956266b.33.1722852458383;
        Mon, 05 Aug 2024 03:07:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d433e8sm432742966b.135.2024.08.05.03.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 03:07:37 -0700 (PDT)
Message-ID: <27da3261-8c1e-4c4d-a548-acdfee1909f2@linaro.org>
Date: Mon, 5 Aug 2024 12:07:35 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Xilinx
 Versal platform
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
 Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 saikrishna12468@gmail.com, git@amd.com
References: <20240801120029.1807180-1-sai.krishna.potthuri@amd.com>
 <20240801120029.1807180-2-sai.krishna.potthuri@amd.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240801120029.1807180-2-sai.krishna.potthuri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/08/2024 14:00, Sai Krishna Potthuri wrote:
> Add Xilinx Versal compatible string and corresponding groups, function and
> pins properties to support pin controller features on Versal platform.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> ---
>  .../bindings/pinctrl/xlnx,versal-pinctrl.yaml | 398 ++++++++++++++++++
>  1 file changed, 398 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
> new file mode 100644
> index 000000000000..4f555cf10612
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
> @@ -0,0 +1,398 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/xlnx,versal-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx Versal Pinctrl
> +
> +maintainers:
> +  - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> +
> +description: |
> +  Please refer to pinctrl-bindings.txt in this directory for details of the
> +  common pinctrl bindings used by client devices, including the meaning of the
> +  phrase "pin configuration node".
> +
> +  Versal's pin configuration nodes act as a container for an arbitrary number of
> +  subnodes. Each of these subnodes represents some desired configuration for a
> +  pin, a group, or a list of pins or groups. This configuration can include the
> +  mux function to select on those pin(s)/group(s), and various pin configuration
> +  parameters, such as pull-up, slew rate, etc.
> +
> +  Each configuration node can consist of multiple nodes describing the pinmux and
> +  pinconf options. Those nodes can be pinmux nodes or pinconf nodes.
> +
> +  The name of each subnode is not important; all subnodes should be enumerated
> +  and processed purely based on their content.

Drop this sentence. First - it is not true. Second, do not repeat schema
in free form text.

> +
> +properties:
> +  compatible:
> +    const: xlnx,versal-pinctrl
> +
> +patternProperties:
> +  '^(.*-)?(default|gpio-grp)$':
> +    type: object
> +    patternProperties:
> +      '^mux':
> +        type: object
> +        description:
> +          Pinctrl node's client devices use subnodes for pin muxes,
> +          which in turn use below standard properties.
> +        $ref: pinmux-node.yaml#
> +
> +        properties:
> +          pins:
> +            description:
> +              List of pins to select (either this or "groups" must be specified)
> +            items:
> +              pattern: '^((LPD|PMC)_)MIO([0-9]|[1-6][0-9]|7[0-7])$'
> +
> +          groups:
> +            description:
> +              List of groups to select (either this or "pins" must be
> +              specified), available groups for this subnode.
> +            items:
> +              anyOf:
> +                - pattern: '^((LPD|PMC)_)MIO([0-9]|[1-6][0-9]|7[0-7])$'
> +                - enum: [spi0_0_grp, spi0_1_grp, spi0_2_grp, spi0_3_grp, spi0_4_grp, spi0_5_grp,
> +                         spi0_ss_0_grp, spi0_ss_1_grp, spi0_ss_2_grp, spi0_ss_3_grp, spi0_ss_4_grp,
> +                         spi0_ss_5_grp, spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp, spi0_ss_9_grp,
> +                         spi0_ss_10_grp, spi0_ss_11_grp, spi0_ss_12_grp, spi0_ss_13_grp, spi0_ss_14_grp,
> +                         spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp, spi1_0_grp, spi1_1_grp,
> +                         spi1_2_grp, spi1_3_grp, spi1_4_grp, spi1_5_grp, spi1_ss_0_grp, spi1_ss_1_grp,
> +                         spi1_ss_2_grp, spi1_ss_3_grp, spi1_ss_4_grp, spi1_ss_5_grp, spi1_ss_6_grp,
> +                         spi1_ss_7_grp, spi1_ss_8_grp, spi1_ss_9_grp, spi1_ss_10_grp, spi1_ss_11_grp,
> +                         spi1_ss_12_grp, spi1_ss_13_grp, spi1_ss_14_grp, spi1_ss_15_grp, spi1_ss_16_grp
> +                         spi1_ss_17_grp, can0_0_grp, can0_1_grp, can0_2_grp, can0_3_grp, can0_4_grp,
> +                         can0_5_grp, can0_6_grp, can0_7_grp, can0_8_grp, can0_9_grp, can0_10_grp,
> +                         can0_11_grp, can0_12_grp, can0_13_grp, can0_14_grp, can0_15_grp, can0_16_grp,
> +                         can0_17_grp, can1_0_grp, can1_1_grp, can1_2_grp, can1_3_grp, can1_4_grp,
> +                         can1_5_grp, can1_6_grp, can1_7_grp, can1_8_grp, can1_9_grp, can1_10_grp,
> +                         can1_11_grp, can1_12_grp, can1_13_grp, can1_14_grp, can1_15_grp, can1_16_grp,
> +                         can1_17_grp, can1_18_grp, i2c0_0_grp, i2c0_1_grp, i2c0_2_grp, i2c0_3_grp,
> +                         i2c0_4_grp, i2c0_5_grp, i2c0_6_grp, i2c0_7_grp, i2c0_8_grp, i2c0_9_grp,
> +                         i2c0_10_grp, i2c0_11_grp, i2c0_12_grp, i2c0_13_grp, i2c0_14_grp, i2c0_15_grp,
> +                         i2c0_16_grp, i2c0_17_grp, i2c1_0_grp, i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
> +                         i2c1_4_grp, i2c1_5_grp, i2c1_6_grp, i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
> +                         i2c1_10_grp, i2c1_11_grp, i2c1_12_grp, i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
> +                         i2c1_16_grp, i2c1_17_grp, i2c1_18_grp, i2c_pmc_0_grp, i2c_pmc_1_grp,
> +                         i2c_pmc_2_grp, i2c_pmc_3_grp, i2c_pmc_4_grp, i2c_pmc_5_grp, i2c_pmc_6_grp,
> +                         i2c_pmc_7_grp, i2c_pmc_8_grp, i2c_pmc_9_grp, i2c_pmc_10_grp, i2c_pmc_11_grp,
> +                         i2c_pmc_12_grp, ttc0_clk_0_grp, ttc0_clk_1_grp, ttc0_clk_2_grp, ttc0_clk_3_grp,
> +                         ttc0_clk_4_grp, ttc0_clk_5_grp, ttc0_clk_6_grp, ttc0_clk_7_grp, ttc0_clk_8_grp,
> +                         ttc0_wav_0_grp, ttc0_wav_1_grp, ttc0_wav_2_grp, ttc0_wav_3_grp, ttc0_wav_4_grp,
> +                         ttc0_wav_5_grp, ttc0_wav_6_grp, ttc0_wav_7_grp, ttc0_wav_8_grp, ttc1_clk_0_grp,
> +                         ttc1_clk_1_grp, ttc1_clk_2_grp, ttc1_clk_3_grp, ttc1_clk_4_grp, ttc1_clk_5_grp,
> +                         ttc1_clk_6_grp, ttc1_clk_7_grp, ttc1_clk_8_grp, ttc1_wav_0_grp, ttc1_wav_1_grp,
> +                         ttc1_wav_2_grp, ttc1_wav_3_grp, ttc1_wav_4_grp, ttc1_wav_5_grp, ttc1_wav_6_grp,
> +                         ttc1_wav_7_grp, ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_clk_1_grp, ttc2_clk_2_grp,
> +                         ttc2_clk_3_grp, ttc2_clk_4_grp, ttc2_clk_5_grp, ttc2_clk_6_grp, ttc2_clk_7_grp,
> +                         ttc2_clk_8_grp, ttc2_wav_0_grp, ttc2_wav_1_grp, ttc2_wav_2_grp, ttc2_wav_3_grp,
> +                         ttc2_wav_4_grp, ttc2_wav_5_grp, ttc2_wav_6_grp, ttc2_wav_7_grp, ttc2_wav_8_grp,
> +                         ttc3_clk_0_grp, ttc3_clk_1_grp, ttc3_clk_2_grp, ttc3_clk_3_grp, ttc3_clk_4_grp,
> +                         ttc3_clk_5_grp, ttc3_clk_6_grp, ttc3_clk_7_grp, ttc3_clk_8_grp, ttc3_wav_0_grp,
> +                         ttc3_wav_1_grp, ttc3_wav_2_grp, ttc3_wav_3_grp, ttc3_wav_4_grp, ttc3_wav_5_grp,
> +                         ttc3_wav_6_grp, ttc3_wav_7_grp, ttc3_wav_8_grp, wwdt0_0_grp, wwdt0_1_grp,
> +                         wwdt0_2_grp, wwdt0_3_grp, wwdt0_4_grp, wwdt0_5_grp, wwdt1_0_grp, wwdt1_1_grp,
> +                         wwdt1_2_grp, wwdt1_3_grp, wwdt1_4_grp, wwdt1_5_grp, sysmon_i2c0_0_grp,
> +                         sysmon_i2c0_1_grp, sysmon_i2c0_2_grp, sysmon_i2c0_3_grp, sysmon_i2c0_4_grp,
> +                         sysmon_i2c0_5_grp, sysmon_i2c0_6_grp, sysmon_i2c0_7_grp, sysmon_i2c0_8_grp,
> +                         sysmon_i2c0_9_grp, sysmon_i2c0_10_grp, sysmon_i2c0_11_grp, sysmon_i2c0_12_grp,
> +                         sysmon_i2c0_13_grp, sysmon_i2c0_14_grp, sysmon_i2c0_15_grp,
> +                         sysmon_i2c0_16_grp, sysmon_i2c0_17_grp, sysmon_i2c0_alrt_0_grp,
> +                         sysmon_i2c0_alrt_1_grp, sysmon_i2c0_alrt_2_grp, sysmon_i2c0_alrt_3_grp,
> +                         sysmon_i2c0_alrt_4_grp, sysmon_i2c0_alrt_5_grp, sysmon_i2c0_alrt_6_grp,
> +                         sysmon_i2c0_alrt_7_grp, sysmon_i2c0_alrt_8_grp, sysmon_i2c0_alrt_9_grp,
> +                         sysmon_i2c0_alrt_10_grp, sysmon_i2c0_alrt_11_grp, sysmon_i2c0_alrt_12_grp,
> +                         sysmon_i2c0_alrt_13_grp, sysmon_i2c0_alrt_14_grp, sysmon_i2c0_alrt_15_grp,
> +                         sysmon_i2c0_alrt_16_grp, sysmon_i2c0_alrt_17_grp, uart0_0_grp, uart0_1_grp,
> +                         uart0_2_grp, uart0_3_grp, uart0_4_grp, uart0_5_grp, uart0_6_grp, uart0_7_grp,
> +                         uart0_8_grp, uart0_ctrl_0_grp, uart0_ctrl_1_grp, uart0_ctrl_2_grp,
> +                         uart0_ctrl_3_grp, uart0_ctrl_4_grp, uart0_ctrl_5_grp, uart0_ctrl_6_grp,
> +                         uart0_ctrl_7_grp, uart0_ctrl_8_grp, uart1_0_grp, uart1_1_grp, uart1_2_grp,
> +                         uart1_3_grp, uart1_4_grp, uart1_5_grp, uart1_6_grp, uart1_7_grp, uart1_8_grp,
> +                         uart1_ctrl_0_grp, uart1_ctrl_1_grp, uart1_ctrl_2_grp, uart1_ctrl_3_grp,
> +                         uart1_ctrl_4_grp, uart1_ctrl_5_grp, uart1_ctrl_6_grp, uart1_ctrl_7_grp,
> +                         uart1_ctrl_8_grp, gpio0_0_grp, gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
> +                         gpio0_4_grp, gpio0_5_grp, gpio0_6_grp, gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
> +                         gpio0_10_grp, gpio0_11_grp, gpio0_12_grp, gpio0_13_grp, gpio0_14_grp,
> +                         gpio0_15_grp, gpio0_16_grp, gpio0_17_grp, gpio0_18_grp, gpio0_19_grp,
> +                         gpio0_20_grp, gpio0_21_grp, gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
> +                         gpio0_25_grp, gpio1_0_grp, gpio1_1_grp, gpio1_2_grp, gpio1_3_grp, gpio1_4_grp,
> +                         gpio1_5_grp, gpio1_6_grp, gpio1_7_grp, gpio1_8_grp, gpio1_9_grp,
> +                         gpio1_10_grp, gpio1_11_grp, gpio1_12_grp, gpio1_13_grp, gpio1_14_grp,
> +                         gpio1_15_grp, gpio1_16_grp, gpio1_17_grp, gpio1_18_grp, gpio1_19_grp,
> +                         gpio1_20_grp, gpio1_21_grp, gpio1_22_grp, gpio1_23_grp, gpio1_24_grp,
> +                         gpio1_25_grp, gpio2_0_grp, gpio2_1_grp, gpio2_2_grp, gpio2_3_grp, gpio2_4_grp,
> +                         gpio2_5_grp, gpio2_6_grp, gpio2_7_grp, gpio2_8_grp, gpio2_9_grp, gpio2_10_grp,
> +                         gpio2_11_grp, gpio2_12_grp, gpio2_13_grp, gpio2_14_grp, gpio2_15_grp,
> +                         gpio2_16_grp, gpio2_17_grp, gpio2_18_grp, gpio2_19_grp, gpio2_20_grp,
> +                         gpio2_21_grp, gpio2_22_grp, gpio2_23_grp, gpio2_24_grp, gpio2_25_grp,
> +                         emio0_0_grp, emio0_1_grp, emio0_2_grp, emio0_3_grp, emio0_4_grp, emio0_5_grp,
> +                         emio0_6_grp, emio0_7_grp, emio0_8_grp, emio0_9_grp, emio0_10_grp,
> +                         emio0_11_grp, emio0_12_grp, emio0_13_grp, emio0_14_grp, emio0_15_grp,
> +                         emio0_16_grp, emio0_17_grp, emio0_18_grp, emio0_19_grp, emio0_20_grp,
> +                         emio0_21_grp, emio0_22_grp, emio0_23_grp, emio0_24_grp, emio0_25_grp,
> +                         emio0_26_grp, emio0_27_grp, emio0_28_grp, emio0_29_grp, emio0_30_grp,
> +                         emio0_31_grp, emio0_32_grp, emio0_33_grp, emio0_34_grp, emio0_35_grp,
> +                         emio0_36_grp, emio0_37_grp, emio0_38_grp, emio0_39_grp, emio0_40_grp,
> +                         emio0_41_grp, emio0_42_grp, emio0_43_grp, emio0_44_grp, emio0_45_grp,
> +                         emio0_46_grp, emio0_47_grp, emio0_48_grp, emio0_49_grp, emio0_50_grp,
> +                         emio0_51_grp, emio0_52_grp, emio0_53_grp, emio0_54_grp, emio0_55_grp,
> +                         emio0_56_grp, emio0_57_grp, emio0_58_grp, emio0_59_grp, emio0_60_grp,
> +                         emio0_61_grp, emio0_62_grp, emio0_63_grp, emio0_64_grp, emio0_65_grp,
> +                         emio0_66_grp, emio0_67_grp, emio0_68_grp, emio0_69_grp, emio0_70_grp,
> +                         emio0_71_grp, emio0_72_grp, emio0_73_grp, emio0_74_grp, emio0_75_grp,
> +                         emio0_76_grp, emio0_77_grp, gem0_0_grp, gem0_1_grp, gem1_0_grp, gem1_1_grp,
> +                         trace0_0_grp, trace0_1_grp, trace0_2_grp, trace0_clk_0_grp, trace0_clk_1_grp,
> +                         trace0_clk_2_grp, mdio0_0_grp, mdio0_1_grp, mdio1_0_grp, mdio1_1_grp,
> +                         gem_tsu0_0_grp, gem_tsu0_1_grp, gem_tsu0_2_grp, gem_tsu0_3_grp, pcie0_0_grp,
> +                         pcie0_1_grp, pcie0_2_grp, smap0_0_grp, usb0_0_grp, sd0_0_grp, sd0_1_grp,
> +                         sd0_2_grp, sd0_3_grp, sd0_4_grp, sd0_5_grp, sd0_6_grp, sd0_7_grp, sd0_8_grp,
> +                         sd0_9_grp, sd0_10_grp, sd0_11_grp, sd0_12_grp, sd0_13_grp, sd0_14_grp,
> +                         sd0_15_grp, sd0_16_grp, sd0_17_grp, sd0_18_grp, sd0_19_grp, sd0_20_grp,
> +                         sd0_21_grp, sd0_pc_0_grp, sd0_pc_1_grp, sd0_cd_0_grp, sd0_cd_1_grp,
> +                         sd0_wp_0_grp, sd0_wp_1_grp, sd1_0_grp, sd1_1_grp, sd1_2_grp, sd1_3_grp,
> +                         sd1_4_grp, sd1_5_grp, sd1_6_grp, sd1_7_grp, sd1_8_grp, sd1_9_grp, sd1_10_grp,
> +                         sd1_11_grp, sd1_12_grp, sd1_13_grp, sd1_14_grp, sd1_15_grp, sd1_16_grp,
> +                         sd1_17_grp, sd1_18_grp, sd1_19_grp, sd1_20_grp, sd1_21_grp, sd1_pc_0_grp,
> +                         sd1_pc_1_grp, sd1_cd_0_grp, sd1_cd_1_grp, sd1_wp_0_grp, sd1_wp_1_grp,
> +                         ospi0_0_grp, ospi0_ss_0_grp, qspi0_0_grp, qspi0_fbclk_0_grp, qspi0_ss_0_grp,
> +                         test_clk_0_grp, test_scan_0_grp, tamper_trigger_0_grp]
> +            maxItems: 78

You miss minItems... I have doubts this was really tested.

> +
> +          function:
> +            description:
> +              Specify the alternative function to be configured for the
> +              given pin groups.
> +            enum: [spi0, spi0_ss, spi1, spi1_ss, can0, can1, i2c0, i2c1, i2c_pmc, ttc0_clk,
> +                   ttc0_wav, ttc1_clk, ttc1_wav, ttc2_clk, ttc2_wav, ttc3_clk, ttc3_wav, wwdt0,
> +                   wwdt1, sysmon_i2c0, sysmon_i2c0_alrt, uart0, uart0_ctrl, uart1, uart1_ctrl,
> +                   gpio0, gpio1, gpio2, emio0, gem0, gem1, trace0, trace0_clk, mdio0, mdio1, gem_tsu0,
> +                   pcie0, smap0, usb0, sd0, sd0_pc, sd0_cd, sd0_wp, sd1, sd1_pc, sd1_wp, sd1_cd,
> +                   ospi0, ospi0_ss, qspi0, qspi0_fbclk, qspi0_ss, test_clk, test_scan, tamper_trigger]
> +
> +        required:
> +          - function
> +
> +        oneOf:
> +          - required: [ groups ]
> +          - required: [ pins ]
> +
> +        additionalProperties: false
> +
> +      '^conf':
> +        type: object
> +        description:
> +          Pinctrl node's client devices use subnodes for pin configurations,
> +          which in turn use the standard properties below.
> +        allOf:
> +          - $ref: pincfg-node.yaml#
> +          - $ref: "#/$defs/pins"
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +$defs:
> +  pins:
> +    properties:
> +      groups:
> +        description:
> +          List of pin groups to select in this subnode.
> +        enum: [spi0_0_grp, spi0_1_grp, spi0_2_grp, spi0_3_grp, spi0_4_grp, spi0_5_grp,
> +               spi0_ss_0_grp, spi0_ss_1_grp, spi0_ss_2_grp, spi0_ss_3_grp, spi0_ss_4_grp,
> +               spi0_ss_5_grp, spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp, spi0_ss_9_grp,
> +               spi0_ss_10_grp, spi0_ss_11_grp, spi0_ss_12_grp, spi0_ss_13_grp, spi0_ss_14_grp,
> +               spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp, spi1_0_grp, spi1_1_grp,
> +               spi1_2_grp, spi1_3_grp, spi1_4_grp, spi1_5_grp, spi1_ss_0_grp, spi1_ss_1_grp,
> +               spi1_ss_2_grp, spi1_ss_3_grp, spi1_ss_4_grp, spi1_ss_5_grp, spi1_ss_6_grp,
> +               spi1_ss_7_grp, spi1_ss_8_grp, spi1_ss_9_grp, spi1_ss_10_grp, spi1_ss_11_grp,
> +               spi1_ss_12_grp, spi1_ss_13_grp, spi1_ss_14_grp, spi1_ss_15_grp, spi1_ss_16_grp
> +               spi1_ss_17_grp, can0_0_grp, can0_1_grp, can0_2_grp, can0_3_grp, can0_4_grp,
> +               can0_5_grp, can0_6_grp, can0_7_grp, can0_8_grp, can0_9_grp, can0_10_grp,
> +               can0_11_grp, can0_12_grp, can0_13_grp, can0_14_grp, can0_15_grp, can0_16_grp,
> +               can0_17_grp, can1_0_grp, can1_1_grp, can1_2_grp, can1_3_grp, can1_4_grp,
> +               can1_5_grp, can1_6_grp, can1_7_grp, can1_8_grp, can1_9_grp, can1_10_grp,
> +               can1_11_grp, can1_12_grp, can1_13_grp, can1_14_grp, can1_15_grp, can1_16_grp,
> +               can1_17_grp, can1_18_grp, i2c0_0_grp, i2c0_1_grp, i2c0_2_grp, i2c0_3_grp,
> +               i2c0_4_grp, i2c0_5_grp, i2c0_6_grp, i2c0_7_grp, i2c0_8_grp, i2c0_9_grp,
> +               i2c0_10_grp, i2c0_11_grp, i2c0_12_grp, i2c0_13_grp, i2c0_14_grp, i2c0_15_grp,
> +               i2c0_16_grp, i2c0_17_grp, i2c1_0_grp, i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
> +               i2c1_4_grp, i2c1_5_grp, i2c1_6_grp, i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
> +               i2c1_10_grp, i2c1_11_grp, i2c1_12_grp, i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
> +               i2c1_16_grp, i2c1_17_grp, i2c1_18_grp, i2c_pmc_0_grp, i2c_pmc_1_grp,
> +               i2c_pmc_2_grp, i2c_pmc_3_grp, i2c_pmc_4_grp, i2c_pmc_5_grp, i2c_pmc_6_grp,
> +               i2c_pmc_7_grp, i2c_pmc_8_grp, i2c_pmc_9_grp, i2c_pmc_10_grp, i2c_pmc_11_grp,
> +               i2c_pmc_12_grp, ttc0_clk_0_grp, ttc0_clk_1_grp, ttc0_clk_2_grp, ttc0_clk_3_grp,
> +               ttc0_clk_4_grp, ttc0_clk_5_grp, ttc0_clk_6_grp, ttc0_clk_7_grp, ttc0_clk_8_grp,
> +               ttc0_wav_0_grp, ttc0_wav_1_grp, ttc0_wav_2_grp, ttc0_wav_3_grp, ttc0_wav_4_grp,
> +               ttc0_wav_5_grp, ttc0_wav_6_grp, ttc0_wav_7_grp, ttc0_wav_8_grp, ttc1_clk_0_grp,
> +               ttc1_clk_1_grp, ttc1_clk_2_grp, ttc1_clk_3_grp, ttc1_clk_4_grp, ttc1_clk_5_grp,
> +               ttc1_clk_6_grp, ttc1_clk_7_grp, ttc1_clk_8_grp, ttc1_wav_0_grp, ttc1_wav_1_grp,
> +               ttc1_wav_2_grp, ttc1_wav_3_grp, ttc1_wav_4_grp, ttc1_wav_5_grp, ttc1_wav_6_grp,
> +               ttc1_wav_7_grp, ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_clk_1_grp, ttc2_clk_2_grp,
> +               ttc2_clk_3_grp, ttc2_clk_4_grp, ttc2_clk_5_grp, ttc2_clk_6_grp, ttc2_clk_7_grp,
> +               ttc2_clk_8_grp, ttc2_wav_0_grp, ttc2_wav_1_grp, ttc2_wav_2_grp, ttc2_wav_3_grp,
> +               ttc2_wav_4_grp, ttc2_wav_5_grp, ttc2_wav_6_grp, ttc2_wav_7_grp, ttc2_wav_8_grp,
> +               ttc3_clk_0_grp, ttc3_clk_1_grp, ttc3_clk_2_grp, ttc3_clk_3_grp, ttc3_clk_4_grp,
> +               ttc3_clk_5_grp, ttc3_clk_6_grp, ttc3_clk_7_grp, ttc3_clk_8_grp, ttc3_wav_0_grp,
> +               ttc3_wav_1_grp, ttc3_wav_2_grp, ttc3_wav_3_grp, ttc3_wav_4_grp, ttc3_wav_5_grp,
> +               ttc3_wav_6_grp, ttc3_wav_7_grp, ttc3_wav_8_grp, wwdt0_0_grp, wwdt0_1_grp,
> +               wwdt0_2_grp, wwdt0_3_grp, wwdt0_4_grp, wwdt0_5_grp, wwdt1_0_grp, wwdt1_1_grp,
> +               wwdt1_2_grp, wwdt1_3_grp, wwdt1_4_grp, wwdt1_5_grp, sysmon_i2c0_0_grp,
> +               sysmon_i2c0_1_grp, sysmon_i2c0_2_grp, sysmon_i2c0_3_grp, sysmon_i2c0_4_grp,
> +               sysmon_i2c0_5_grp, sysmon_i2c0_6_grp, sysmon_i2c0_7_grp, sysmon_i2c0_8_grp,
> +               sysmon_i2c0_9_grp, sysmon_i2c0_10_grp, sysmon_i2c0_11_grp, sysmon_i2c0_12_grp,
> +               sysmon_i2c0_13_grp, sysmon_i2c0_14_grp, sysmon_i2c0_15_grp,
> +               sysmon_i2c0_16_grp, sysmon_i2c0_17_grp, sysmon_i2c0_alrt_0_grp,
> +               sysmon_i2c0_alrt_1_grp, sysmon_i2c0_alrt_2_grp, sysmon_i2c0_alrt_3_grp,
> +               sysmon_i2c0_alrt_4_grp, sysmon_i2c0_alrt_5_grp, sysmon_i2c0_alrt_6_grp,
> +               sysmon_i2c0_alrt_7_grp, sysmon_i2c0_alrt_8_grp, sysmon_i2c0_alrt_9_grp,
> +               sysmon_i2c0_alrt_10_grp, sysmon_i2c0_alrt_11_grp, sysmon_i2c0_alrt_12_grp,
> +               sysmon_i2c0_alrt_13_grp, sysmon_i2c0_alrt_14_grp, sysmon_i2c0_alrt_15_grp,
> +               sysmon_i2c0_alrt_16_grp, sysmon_i2c0_alrt_17_grp, uart0_0_grp, uart0_1_grp,
> +               uart0_2_grp, uart0_3_grp, uart0_4_grp, uart0_5_grp, uart0_6_grp, uart0_7_grp,
> +               uart0_8_grp, uart0_ctrl_0_grp, uart0_ctrl_1_grp, uart0_ctrl_2_grp,
> +               uart0_ctrl_3_grp, uart0_ctrl_4_grp, uart0_ctrl_5_grp, uart0_ctrl_6_grp,
> +               uart0_ctrl_7_grp, uart0_ctrl_8_grp, uart1_0_grp, uart1_1_grp, uart1_2_grp,
> +               uart1_3_grp, uart1_4_grp, uart1_5_grp, uart1_6_grp, uart1_7_grp, uart1_8_grp,
> +               uart1_ctrl_0_grp, uart1_ctrl_1_grp, uart1_ctrl_2_grp, uart1_ctrl_3_grp,
> +               uart1_ctrl_4_grp, uart1_ctrl_5_grp, uart1_ctrl_6_grp, uart1_ctrl_7_grp,
> +               uart1_ctrl_8_grp, gpio0_0_grp, gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
> +               gpio0_4_grp, gpio0_5_grp, gpio0_6_grp, gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
> +               gpio0_10_grp, gpio0_11_grp, gpio0_12_grp, gpio0_13_grp, gpio0_14_grp,
> +               gpio0_15_grp, gpio0_16_grp, gpio0_17_grp, gpio0_18_grp, gpio0_19_grp,
> +               gpio0_20_grp, gpio0_21_grp, gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
> +               gpio0_25_grp, gpio1_0_grp, gpio1_1_grp, gpio1_2_grp, gpio1_3_grp, gpio1_4_grp,
> +               gpio1_5_grp, gpio1_6_grp, gpio1_7_grp, gpio1_8_grp, gpio1_9_grp,
> +               gpio1_10_grp, gpio1_11_grp, gpio1_12_grp, gpio1_13_grp, gpio1_14_grp,
> +               gpio1_15_grp, gpio1_16_grp, gpio1_17_grp, gpio1_18_grp, gpio1_19_grp,
> +               gpio1_20_grp, gpio1_21_grp, gpio1_22_grp, gpio1_23_grp, gpio1_24_grp,
> +               gpio1_25_grp, gpio2_0_grp, gpio2_1_grp, gpio2_2_grp, gpio2_3_grp, gpio2_4_grp,
> +               gpio2_5_grp, gpio2_6_grp, gpio2_7_grp, gpio2_8_grp, gpio2_9_grp, gpio2_10_grp,
> +               gpio2_11_grp, gpio2_12_grp, gpio2_13_grp, gpio2_14_grp, gpio2_15_grp,
> +               gpio2_16_grp, gpio2_17_grp, gpio2_18_grp, gpio2_19_grp, gpio2_20_grp,
> +               gpio2_21_grp, gpio2_22_grp, gpio2_23_grp, gpio2_24_grp, gpio2_25_grp,
> +               emio0_0_grp, emio0_1_grp, emio0_2_grp, emio0_3_grp, emio0_4_grp, emio0_5_grp,
> +               emio0_6_grp, emio0_7_grp, emio0_8_grp, emio0_9_grp, emio0_10_grp,
> +               emio0_11_grp, emio0_12_grp, emio0_13_grp, emio0_14_grp, emio0_15_grp,
> +               emio0_16_grp, emio0_17_grp, emio0_18_grp, emio0_19_grp, emio0_20_grp,
> +               emio0_21_grp, emio0_22_grp, emio0_23_grp, emio0_24_grp, emio0_25_grp,
> +               emio0_26_grp, emio0_27_grp, emio0_28_grp, emio0_29_grp, emio0_30_grp,
> +               emio0_31_grp, emio0_32_grp, emio0_33_grp, emio0_34_grp, emio0_35_grp,
> +               emio0_36_grp, emio0_37_grp, emio0_38_grp, emio0_39_grp, emio0_40_grp,
> +               emio0_41_grp, emio0_42_grp, emio0_43_grp, emio0_44_grp, emio0_45_grp,
> +               emio0_46_grp, emio0_47_grp, emio0_48_grp, emio0_49_grp, emio0_50_grp,
> +               emio0_51_grp, emio0_52_grp, emio0_53_grp, emio0_54_grp, emio0_55_grp,
> +               emio0_56_grp, emio0_57_grp, emio0_58_grp, emio0_59_grp, emio0_60_grp,
> +               emio0_61_grp, emio0_62_grp, emio0_63_grp, emio0_64_grp, emio0_65_grp,
> +               emio0_66_grp, emio0_67_grp, emio0_68_grp, emio0_69_grp, emio0_70_grp,
> +               emio0_71_grp, emio0_72_grp, emio0_73_grp, emio0_74_grp, emio0_75_grp,
> +               emio0_76_grp, emio0_77_grp, gem0_0_grp, gem0_1_grp, gem1_0_grp, gem1_1_grp,
> +               trace0_0_grp, trace0_1_grp, trace0_2_grp, trace0_clk_0_grp, trace0_clk_1_grp,
> +               trace0_clk_2_grp, mdio0_0_grp, mdio0_1_grp, mdio1_0_grp, mdio1_1_grp,
> +               gem_tsu0_0_grp, gem_tsu0_1_grp, gem_tsu0_2_grp, gem_tsu0_3_grp, pcie0_0_grp,
> +               pcie0_1_grp, pcie0_2_grp, smap0_0_grp, usb0_0_grp, sd0_0_grp, sd0_1_grp,
> +               sd0_2_grp, sd0_3_grp, sd0_4_grp, sd0_5_grp, sd0_6_grp, sd0_7_grp, sd0_8_grp,
> +               sd0_9_grp, sd0_10_grp, sd0_11_grp, sd0_12_grp, sd0_13_grp, sd0_14_grp,
> +               sd0_15_grp, sd0_16_grp, sd0_17_grp, sd0_18_grp, sd0_19_grp, sd0_20_grp,
> +               sd0_21_grp, sd0_pc_0_grp, sd0_pc_1_grp, sd0_cd_0_grp, sd0_cd_1_grp,
> +               sd0_wp_0_grp, sd0_wp_1_grp, sd1_0_grp, sd1_1_grp, sd1_2_grp, sd1_3_grp,
> +               sd1_4_grp, sd1_5_grp, sd1_6_grp, sd1_7_grp, sd1_8_grp, sd1_9_grp, sd1_10_grp,
> +               sd1_11_grp, sd1_12_grp, sd1_13_grp, sd1_14_grp, sd1_15_grp, sd1_16_grp,
> +               sd1_17_grp, sd1_18_grp, sd1_19_grp, sd1_20_grp, sd1_21_grp, sd1_pc_0_grp,
> +               sd1_pc_1_grp, sd1_cd_0_grp, sd1_cd_1_grp, sd1_wp_0_grp, sd1_wp_1_grp,
> +               ospi0_0_grp, ospi0_ss_0_grp, qspi0_0_grp, qspi0_fbclk_0_grp, qspi0_ss_0_grp,
> +               test_clk_0_grp, test_scan_0_grp, tamper_trigger_0_grp]
> +
> +      pins:
> +        description:
> +          List of pin names to select in this subnode.
> +        items:
> +          pattern: '^((LPD|PMC)_)MIO([0-9]|[1-6][0-9]|7[0-7])$'
> +        maxItems: 78
> +
> +      bias-pull-up: true
> +
> +      bias-pull-down: true
> +
> +      bias-disable: true
> +
> +      input-schmitt-enable: true
> +
> +      input-schmitt-disable: true
> +
> +      bias-high-impedance: true
> +
> +      low-power-enable: true
> +
> +      low-power-disable: true

Why do you need to copy all of these? Just switch to unevaluatedProperties.

> +
> +      slew-rate:
> +        enum: [0, 1]
> +
> +      output-enable:
> +        description:
> +          This will internally disable the tri-state for MIO pins.
> +
> +      drive-strength:

drive-strength-microamp

> +        description:
> +          Selects the drive strength for MIO pins, in mA.
> +        enum: [2, 4, 8, 12]
> +
> +      power-source:
> +        enum: [0, 1]
> +
> +    oneOf:
> +      - required: [ groups ]
> +      - required: [ pins ]
> +
> +    additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
> +    versal_firmware: versal-firmware {

Drop unused labels.

> +        pinctrl0: pinctrl {
> +          compatible = "xlnx,versal-pinctrl";


Some odd indentation.

> +
> +          pinctrl_uart0_default: uart0-default {
> +             mux {
> +                 groups = "uart0_4_grp", "uart0_5_grp";
> +                 function = "uart0";
> +             };
> +
> +             conf {
> +                groups = "uart0_4_grp";
> +                slew-rate = <SLEW_RATE_SLOW>;
> +                power-source = <IO_STANDARD_LVCMOS18>;
> +             };
> +
> +             conf-rx {
> +                pins = "PMC_MIO42";
> +                bias-pull-up;
> +             };
> +
> +             conf-tx {
> +                pins = "PMC_MIO43";
> +                bias-disable;
> +                input-schmitt-disable;
> +             };
> +          };
> +        };
> +    };
> +
> +    uart0 {
> +         pinctrl-names = "default";
> +         pinctrl-0 = <&pinctrl_uart0_default>;

Drop this node, unrelated.

Best regards,
Krzysztof


