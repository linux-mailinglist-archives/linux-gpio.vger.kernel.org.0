Return-Path: <linux-gpio+bounces-30401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC212D0F267
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 15:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D50F3004E1E
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 14:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0A7349AFB;
	Sun, 11 Jan 2026 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l107AcbN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEB534887C
	for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 14:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142565; cv=none; b=WPwrmnv8UniVKvkTriInDMs4B89bTONM0kReVBVD8HBy0YnWa0XG4I94NaLgrMUNpuH06+G4C47S0UE43Yg09uzZTbsyugsoyNusMysGFJBoRKNogLHJQ+cjIK68JwwD35uam0T7xU7Fcp79gSVeNd+5t7LhDcCD579dyYmZ/X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142565; c=relaxed/simple;
	bh=r3/sjCZcn12IuIXnTNYHXq/ljVnoUjX3EA+fjUfOI3Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LEE/IDZFuX69D7yTrmcY7mRpbnvQ4CNpwctwshEGaptjTecjKJS3mOaBXmwZAiPLVEfehjhFwpQ+hMGhz12kqx48Xut1rC7AZmUKhoBunEMNWMVnnwF8I9GNm6NRjikX0mZimlx71uN/445p/9VFwjc/vbTs2UBX3sp/dJGLiYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l107AcbN; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64b9230f564so7978297a12.1
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 06:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142562; x=1768747362; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G/KcOMY2Aiby4Ym2c9/9bLw/G2mVDeqsJ5KVEAaYuIM=;
        b=l107AcbNznzRzuNtn2TbxkYQlhR6Da9D0PeoZ7sVNzp9wAV5yVHDFfgDXtNcse8JtP
         1DmmAfeZqqOcYFTSenS6cILajX5b6RgXX6HIhmIY3UZg5aJbo1JdFeC80Cv5hvn3bc/j
         KKvki4OvEDKaJ9Fj86eywK4bKJI3rT+mJc+W0fyaHWSjZlsmYrrYq/9nELRLzTNYMz8o
         6P1n1ZpvhhJDtfSLkMqCU6tFwKyfICSvVpovW3EKjYdzLfS1yWeDeZCGMKox7umDzxa/
         PmGX3iy4E8hkGBE0MJQGizSmXp2IAvi9VaWoFC5Y6NGSSlZKyu7zWYQjhjJS6J8/dfWu
         Ev4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142562; x=1768747362;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/KcOMY2Aiby4Ym2c9/9bLw/G2mVDeqsJ5KVEAaYuIM=;
        b=H6a/PYzARCgbZVAFb6ScGCpvId4ZwD7JTbeT1hMcx48iRCiQMNjDgwphoIO4Czszmf
         LrtTuQdH7ix/EZRhOzpOMRPrdHEDkHZr6UTw7Ao+GENRQu7FwrWriopEzev7ITn78i7W
         pNE+W1EYndnIfgkb59/8Jx5c+MznezNGR9Ie+5Gs/Lq37DZmTTXdw8KWrSnQu4AOjukm
         a2w1OsEA4JvJibGANAb2wzKfaHNKOHwtsD27TEdxbLKrOmr0tIRZR3VFkKHxYnpxsP7S
         Cw9VjlbZcHEa6ZD2DmEW/KBZkD+2YFdV7NbWZ/a8wGAg/zNvlm3U3wF2aMEyQgxS0bzU
         u0WQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6NBrbqu0vAktGmpOvIh+mkmtQnF/TxFPC93KhlIhOP3VgSLNeg4oiPEsO3DIPaKebafC7hKrrsyp2@vger.kernel.org
X-Gm-Message-State: AOJu0YwrOxN6MLD1JvgJiBEL4RCil7VoYYtfdrs9ZRuRp+G34f85ZWQb
	CtxB/RsQveU7J/ZTkgiw4zkk5QoaW+ixfANybXbdMbQlfKfBNACQmi3ZXYa52fTk7xI=
X-Gm-Gg: AY/fxX7wV1qp+c3rDvIfGWE0XbYDpC1tGPLg8ZP+WVYuNmFHm0hxVSOpzgZRvRfcaGc
	bZoo+vTURq0q2Vy14HIxH1TsbbB4hZGbBJzQsvRKaKk8rkoUEi9lX15eIbfItB+1SKwHkL+OvPK
	9+3ajijfjEKLsVuNRxX2kQFZAcGyMzEZt1hGAeb7WS/ynBXNfCHZwmY+HfgJ3nL8k0qYCjxXeaV
	R/FPG+2QQP1md02FIla6qHqQLerzKRjclCW7Buo6lNsjLiMFCfutcTWr96Cw4XfeC7BruJiIg9H
	Du3Z5JEYkOFCBT03wkeX5oFZTq+ylZO8woemN9n9mvFuIaSinJcXh+5CmTnRk3a1Ly37eWLDBed
	1onl/+XBgNEkeKB2bpHqLQ/HWmdQSr4deZP+hleTt9oMBf7Ik5NEv/x7G/a4XihcF4oZaQdIzjJ
	1rWJVouaNJT9HJ4fPLQSSCKnA=
X-Google-Smtp-Source: AGHT+IE39UCsqaKXvD3F+fxNGt3UWpgz3o9+Q+iDczrztF9S6FJS6cHaS0zXDwLhDt1npYxNq43EAw==
X-Received: by 2002:a05:6402:26d1:b0:64b:5f4e:9e6d with SMTP id 4fb4d7f45d1cf-65097e50c56mr13973823a12.18.1768142561550;
        Sun, 11 Jan 2026 06:42:41 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be642f5sm14853659a12.20.2026.01.11.06.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:42:41 -0800 (PST)
Message-ID: <858ca139-61c5-45e3-a2c9-d0af414e3592@tuxon.dev>
Date: Sun, 11 Jan 2026 16:42:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 15/15] arm64: dts: microchip: add EV23X71A board
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-16-robert.marko@sartura.hr>
Content-Language: en-US
In-Reply-To: <20251229184004.571837-16-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Robert,

On 12/29/25 20:37, Robert Marko wrote:
> Microchip EV23X71A is an LAN9696 based evaluation board.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> * Split from SoC DTSI commit
> * Apply DTS coding style
> * Enclose array in i2c-mux
> * Alphanumericaly sort nodes
> * Change management port mode to RGMII-ID
> 
>   arch/arm64/boot/dts/microchip/Makefile        |   1 +
>   .../boot/dts/microchip/lan9696-ev23x71a.dts   | 757 ++++++++++++++++++
>   2 files changed, 758 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> 
> diff --git a/arch/arm64/boot/dts/microchip/Makefile b/arch/arm64/boot/dts/microchip/Makefile
> index c6e0313eea0f..09d16fc1ce9a 100644
> --- a/arch/arm64/boot/dts/microchip/Makefile
> +++ b/arch/arm64/boot/dts/microchip/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_LAN969X) += lan9696-ev23x71a.dtb
>   dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb125.dtb
>   dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb134.dtb sparx5_pcb134_emmc.dtb
>   dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb135.dtb sparx5_pcb135_emmc.dtb
> diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> new file mode 100644
> index 000000000000..435df455b078
> --- /dev/null
> +++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts

[ ...]

> +&gpio {
> +	emmc_sd_pins: emmc-sd-pins {
> +		/* eMMC_SD - CMD, CLK, D0, D1, D2, D3, D4, D5, D6, D7, RSTN */
> +		pins = "GPIO_14", "GPIO_15", "GPIO_16", "GPIO_17",
> +		       "GPIO_18", "GPIO_19", "GPIO_20", "GPIO_21",
> +		       "GPIO_22", "GPIO_23", "GPIO_24";
> +		function = "emmc_sd";
> +	};
> +
> +	fan_pins: fan-pins {
> +		pins = "GPIO_25", "GPIO_26";
> +		function = "fan";
> +	};
> +
> +	fc0_pins: fc0-pins {
> +		pins = "GPIO_3", "GPIO_4";
> +		function = "fc";
> +	};
> +
> +	fc2_pins: fc2-pins {
> +		pins = "GPIO_64", "GPIO_65", "GPIO_66";
> +		function = "fc";
> +	};
> +
> +	fc3_pins: fc3-pins {
> +		pins = "GPIO_55", "GPIO_56";
> +		function = "fc";
> +	};
> +
> +	mdio_pins: mdio-pins {
> +		pins = "GPIO_9", "GPIO_10";
> +		function = "miim";
> +	};
> +
> +	mdio_irq_pins: mdio-irq-pins {
> +		pins = "GPIO_11";
> +		function = "miim_irq";
> +	};
> +
> +	sgpio_pins: sgpio-pins {
> +		/* SCK, D0, D1, LD */
> +		pins = "GPIO_5", "GPIO_6", "GPIO_7", "GPIO_8";
> +		function = "sgpio_a";
> +	};
> +
> +	usb_ulpi_pins: usb-ulpi-pins {
> +		pins = "GPIO_30", "GPIO_31", "GPIO_32", "GPIO_33",
> +		       "GPIO_34", "GPIO_35", "GPIO_36", "GPIO_37",
> +		       "GPIO_38", "GPIO_39", "GPIO_40", "GPIO_41";
> +		function = "usb_ulpi";
> +	};
> +
> +	usb_rst_pins: usb-rst-pins {
> +		pins = "GPIO_12";
> +		function = "usb2phy_rst";
> +	};
> +
> +	usb_over_pins: usb-over-pins {
> +		pins = "GPIO_13";
> +		function = "usb_over_detect";
> +	};
> +
> +	usb_power_pins: usb-power-pins {
> +		pins = "GPIO_1";
> +		function = "usb_power";
> +	};
> +
> +	ptp_out_pins: ptp-out-pins {
> +		pins = "GPIO_58";
> +		function = "ptpsync_4";
> +	};

Could you please move this one upper to have all the entries in the gpio 
container alphanumerically sorted?

> +
> +	ptp_ext_pins: ptp-ext-pins {
> +		pins = "GPIO_59";
> +		function = "ptpsync_5";
> +	};

Same here.

[ ...]

> +		port29: port@29 {
> +			reg = <29>;
> +			phys = <&serdes 11>;
> +			phy-handle = <&phy3>;
> +			phy-mode = "rgmii-id";
> +			microchip,bandwidth = <1000>;

There are some questions around this node from Andrew in v1 of this series, 
which I don't see an answer for in any of the following versions. Could you 
please clarify?

The rest looks good to me.

Thank you,
Claudiu


