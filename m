Return-Path: <linux-gpio+bounces-26069-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC6CB55124
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 16:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B4891CC76C0
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2C7311959;
	Fri, 12 Sep 2025 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBdXf9dS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E5E31B13D
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686901; cv=none; b=SGVZYCv/gCSBoOliVYHldA8sNiclk7Mj9mSdZFJgPJxb+sPo4KEoz3+q9xTd4wV1Ou3Sr7dABWZh/vxvmIR4dixF5aYfTLdeIKRLOWxynGvrNZcxPn2RBwmc52MKOV0qa99QrOi3rKft24Nb5Ho9Y9UDzC+10jx7pdfvPfbggXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686901; c=relaxed/simple;
	bh=H2Ru2xlgqZwcz5u5V3fdTmUhUSyBzNp/VtbsBBWZGVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyHSNlkYtjR1Yoc4b6oR5Zhc2Ra7d92DlVZM8vNw9aQ1dxJRGJe1yJDbhI6C1NKOvBpRl++UQoiMQLxkdcCVcNJJX8nVSK6Tbt4bv15X2NP/RDnhBEcoHnARX9GzFHWtFX2LMbuakIN/4WguSiuIzHQsZ0N38PLKLnAUc+dDJJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBdXf9dS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45decc9e83dso12539455e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 07:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686897; x=1758291697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YVQP7t1cLcCA6lBEVBFP9JUfq8lpy4ICoOinMrOslso=;
        b=CBdXf9dS54yk6jm691c5nmv6I6W8JXRSONL99xjPTiVFCcyyha1rbbRiZS3HrnAEkX
         vtcsinMeGN0wQx2f/YvFYnTEEmIkFmZ0TUohjHpZbfSee7gfVdazQUFfXsujjQ2sqEAg
         wN3Bbm26Y23MMc04gWyojTR0nn2p/m4DmbpUJGBNVhtGQazWEbwDIsNSUsWM9rkV55j1
         Aa0/oNj2x/YW1aqEPYO8u35mjo7e3CILmK6aOjNKuRcbHf6pFcjXaUpr3d8jnRcd/eAd
         2kfhp/S6l43HmyYQq9nctIvUX6LUw+U1p7VV8GlcGpTwc09J25T7XkqFZQDWs3Cd4796
         Ew0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686897; x=1758291697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVQP7t1cLcCA6lBEVBFP9JUfq8lpy4ICoOinMrOslso=;
        b=p4mQgopt2rvMpXvySnVUBChFu8YkC73l3o2ioP253C36zaiNFOUShnZDcKrXeuC0TC
         XHrv4I+XDsT8WbKw4s33ILnw9PB6L7jcM62JpcXDjg0fSJS1vQ1Ph2L4ih4frBoromfz
         Nr+W36eTCbBzh0eryH1zvRLzLNdMlu0QhVCY7UboE4XALDE01qb2LmGpKA/XDahqOMrC
         ZToqmo4qGJwCoDsvymDhXdBrZd/3Ve78KJjrZMh7jnm/g2N4CNpoensoCtO283c+SYid
         RzWjvrpK6JrcSbjvU2qDjfRK/j3TH9/z+q9q6iLKY0y3XLA329WzAceSbP3alXYEF/lB
         dsAg==
X-Forwarded-Encrypted: i=1; AJvYcCXuJ7AqLBz5qIedGmuCP3ZXg/Xfp3bET/wb+7KxljZ1k8HNbOlmgpNIqpF3/g6i9iSzKk9pQwcxGCws@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx63gr9tD6OlbbKmUe9POxpNtLXz/xbTp85JnFGRwp9dPrsDa6
	fyh4QuBcLQvCo/LeWwMv8JI6y9I75TQyc3QLai5A1+UmXsN0IL2nC9CK
X-Gm-Gg: ASbGncvIIpAbhnIwKgZtzPmau1QDQplDzCDFKxHxYcSHvB45fqUNtKsAC3qxiTECyBK
	ml9hXpyT5FFQxnYwInd5oyeHp8JiY7Jl/+/moDNk2pYD/TK0mRJ8pVpCRl71y0lPJxUJQV36EWk
	h7bM0HUnj1FP88McxOZ4CUw7S3ig/rfEXNnElaJJpcCvXinw7FhxldnjH/POH2O0B6MdZgtYo+4
	PdhBlAyc71F9fA/QYX7oW8M1+CF6LVs4Z7F+3hMMzWY3EISxPaTqb0Gkzd9KxTBf+lHfQqDZRIS
	0LE+UxbpPNSNlEtEzD15j99Gu9/brJPlPT4gLNKwJ1zCkesQiUXXpDKoHKFftPJOMWZZAvM49Ly
	/Gz38c6IN8qS1y98B7VfiZ2kVrtdFDsQGUtB5C6QkuQ==
X-Google-Smtp-Source: AGHT+IG+xDsxpXBLWFezvQTqJTVrSqvL47N9F5wGJK2iMq/HB1ui6QHRTpehxtgIBE7xqsz00wIiOg==
X-Received: by 2002:a05:600c:6b06:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-45f211d0795mr28862295e9.10.1757686897084;
        Fri, 12 Sep 2025 07:21:37 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e015784c3sm71413955e9.10.2025.09.12.07.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:21:35 -0700 (PDT)
Message-ID: <fb81c74a-d53d-4917-9516-9854e825913a@gmail.com>
Date: Fri, 12 Sep 2025 16:19:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/38] arm64: dts: mediatek: mt8183: Migrate to display
 controller OF graph
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 atenart@kernel.org, jitao.shi@mediatek.com, ck.hu@mediatek.com,
 houlong.wei@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com,
 andy.teng@mediatek.com, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-33-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-33-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> The display related IPs in MT8183 are flexible and support being
> interconnected with different instances of DDP IPs forming a full
> Display Data Path that ends with an actual display output, which
> is board specific.
> 
> Add a common graph in the main mt8183.dtsi devicetree, which is
> shared between all of the currently supported boards, and do it
> such that only a very minimal amount of changes are needed to
> each board - the only required change was done in mt8183-pumpkin,
> using a phandle to assign the display to DPI0.
> 
> All boards featuring any display functionality will extend this
> common graph to hook the display controller of the SoC to their
> specific output port(s).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   .../boot/dts/mediatek/mt8183-pumpkin.dts      |   8 +-
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 239 +++++++++++++++++-
>   2 files changed, 238 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> index d5fcb010e1ac..cf1d33384bf0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> @@ -531,10 +531,8 @@ &dpi0 {
>   	pinctrl-0 = <&dpi_func_pins>;
>   	pinctrl-1 = <&dpi_idle_pins>;
>   	status = "okay";
> +};
>   
> -	port {
> -		dpi_out: endpoint {
> -			remote-endpoint = <&it66121_in>;
> -		};
> -	};
> +&dpi_out {
> +	remote-endpoint = <&it66121_in>;
>   };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 3c1fe80e64b9..960d8955d018 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1667,6 +1667,21 @@ mmsys: syscon@14000000 {
>   			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
>   				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> +
> +			port {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				mmsys_ep_main: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&ovl0_in>;
> +				};
> +
> +				mmsys_ep_ext: endpoint@1 {
> +					reg = <1>;
> +					remote-endpoint = <&ovl_2l1_in>;
> +				};
> +			};
>   		};
>   
>   		dma-controller0@14001000 {
> @@ -1733,6 +1748,25 @@ ovl0: ovl@14008000 {
>   			clocks = <&mmsys CLK_MM_DISP_OVL0>;
>   			iommus = <&iommu M4U_PORT_DISP_OVL0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x8000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					ovl0_in: endpoint {
> +						remote-endpoint = <&mmsys_ep_main>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					ovl0_out: endpoint {
> +						remote-endpoint = <&ovl_2l0_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		ovl_2l0: ovl@14009000 {
> @@ -1743,6 +1777,25 @@ ovl_2l0: ovl@14009000 {
>   			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
>   			iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					ovl_2l0_in: endpoint {
> +						remote-endpoint = <&ovl0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					ovl_2l0_out: endpoint {
> +						remote-endpoint = <&rdma0_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		ovl_2l1: ovl@1400a000 {
> @@ -1753,6 +1806,25 @@ ovl_2l1: ovl@1400a000 {
>   			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
>   			iommus = <&iommu M4U_PORT_DISP_2L_OVL1_LARB0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					ovl_2l1_in: endpoint {
> +						remote-endpoint = <&mmsys_ep_ext>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					ovl_2l1_out: endpoint {
> +						remote-endpoint = <&rdma1_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		rdma0: rdma@1400b000 {
> @@ -1764,6 +1836,25 @@ rdma0: rdma@1400b000 {
>   			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
>   			mediatek,rdma-fifo-size = <5120>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					rdma0_in: endpoint {
> +						remote-endpoint = <&ovl_2l0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					rdma0_out: endpoint {
> +						remote-endpoint = <&color0_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		rdma1: rdma@1400c000 {
> @@ -1775,6 +1866,25 @@ rdma1: rdma@1400c000 {
>   			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
>   			mediatek,rdma-fifo-size = <2048>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					rdma1_in: endpoint {
> +						remote-endpoint = <&ovl_2l1_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					rdma1_out: endpoint {
> +						remote-endpoint = <&dpi_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		color0: color@1400e000 {
> @@ -1785,6 +1895,25 @@ color0: color@1400e000 {
>   			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					color0_in: endpoint {
> +						remote-endpoint = <&rdma0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					color0_out: endpoint {
> +						remote-endpoint = <&ccorr0_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		ccorr0: ccorr@1400f000 {
> @@ -1794,6 +1923,25 @@ ccorr0: ccorr@1400f000 {
>   			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					ccorr0_in: endpoint {
> +						remote-endpoint = <&color0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					ccorr0_out: endpoint {
> +						remote-endpoint = <&aal0_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		aal0: aal@14010000 {
> @@ -1803,6 +1951,25 @@ aal0: aal@14010000 {
>   			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_AAL0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					aal0_in: endpoint {
> +						remote-endpoint = <&ccorr0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					aal0_out: endpoint {
> +						remote-endpoint = <&gamma0_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		gamma0: gamma@14011000 {
> @@ -1812,6 +1979,25 @@ gamma0: gamma@14011000 {
>   			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					gamma0_in: endpoint {
> +						remote-endpoint = <&aal0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					gamma0_out: endpoint {
> +						remote-endpoint = <&dither0_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		dither0: dither@14012000 {
> @@ -1821,6 +2007,25 @@ dither0: dither@14012000 {
>   			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dither0_in: endpoint {
> +						remote-endpoint = <&gamma0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					dither0_out: endpoint {
> +						remote-endpoint = <&dsi_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		dsi0: dsi@14014000 {
> @@ -1837,8 +2042,21 @@ dsi0: dsi@14014000 {
>   			phy-names = "dphy";
>   			status = "disabled";
>   
> -			port {
> -				dsi_out: endpoint { };
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dsi_in: endpoint {
> +						remote-endpoint = <&dither0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					dsi_out: endpoint { };
> +				};
>   			};
>   		};
>   
> @@ -1853,8 +2071,21 @@ dpi0: dpi@14015000 {
>   			clock-names = "pixel", "engine", "pll";
>   			status = "disabled";
>   
> -			port {
> -				dpi_out: endpoint { };
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dpi_in: endpoint {
> +						remote-endpoint = <&rdma1_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					dpi_out: endpoint { };
> +				};
>   			};
>   		};
>   


