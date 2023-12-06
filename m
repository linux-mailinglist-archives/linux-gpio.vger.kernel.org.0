Return-Path: <linux-gpio+bounces-1065-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7A2806FB8
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 13:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3F51281882
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 12:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A27D36AE7;
	Wed,  6 Dec 2023 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GL4G4Cpa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7FBED41
	for <linux-gpio@vger.kernel.org>; Wed,  6 Dec 2023 04:30:42 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40bda47c489so50368935e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Dec 2023 04:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701865841; x=1702470641; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gc2ntkoTShdEBwllBOG4rF/rr9xiDv3tAETL/Jav0Vk=;
        b=GL4G4CpafP7P2VnXOpEgbvYpbirY+bPPqu0793S8g0HQ/5QMog/dcWIG0+M+vWNuAc
         GmbJjo9BJrjHG2gD9Jv87L2EAxyr9nj9SY0NxoCo27XbsiRnxM/1pHTegzMu1THX5K4W
         1jVEgQWJywvO+q23ftcGLGQ5vurjWphWTBB3eEtEwHDaU6ePDPCChRLxIN37TtsaPV/5
         5ckQ2w7cIa6gt4Zm1KySEmt1CqpyPmtQtOrMbMt7w0kskPdSJn5G9/Id+ASnUPiBxWXt
         OsSpslSrqvLW6DpZPiwn6UgDQJzqMuXjDKVza3RrsSJ/i1hTK/i0tFT1pX7OyTi3KqUs
         wNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701865841; x=1702470641;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gc2ntkoTShdEBwllBOG4rF/rr9xiDv3tAETL/Jav0Vk=;
        b=bX76cfMxPdoLi2VKgRFZ77TtuRBvqgVXMiFIZCOmUiNH5gL0PThksJWattJI0Rialb
         ZCaUX1MI/633rlOLlL6850+ehoWiy/AMTa1Q+Vg7UFgNHbCYKxX2YBh48WBUBrEJ37hA
         DqkTd0pqgDTMCsLsYTZ+E9MLuilaAqiEoiPyjnCHvxoq5gnQbSZ96BjHWznO4Ny/8qWc
         Bio/R0+HXJ+g23fLEYS/zf1sf9zp4GOS/+DkCvGSnTlZZ599iyhFS0lpsrU3Br14vOyk
         rB+1bES/YJ6uNSozI5eakoZTarR6Lk+foDoomjkbLeQzT6Kd7AM2iOynHZ1EXV6QBrmy
         YFjA==
X-Gm-Message-State: AOJu0YxZVzonPYpScf8mHSdWHnHovg3kLDVWzkKAS8pAK+C8DOnw+z+Z
	ygN1KPF4GjNedb/uLGivifLDfQ==
X-Google-Smtp-Source: AGHT+IGbvAtCRyJ/+D7Ia80B4kAtNqKFbVvgpz/mjpVjvbfrPm9mXg4sGbWIF2mmxMZ4z9+ih3afgA==
X-Received: by 2002:a7b:ca54:0:b0:40b:5e59:c567 with SMTP id m20-20020a7bca54000000b0040b5e59c567mr597074wml.145.1701865841085;
        Wed, 06 Dec 2023 04:30:41 -0800 (PST)
Received: from [10.1.1.118] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id hg10-20020a05600c538a00b0040b398f0585sm22066938wmb.9.2023.12.06.04.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 04:30:40 -0800 (PST)
Message-ID: <6e595a110444033de6ecd35bedc6e84ea1c43fdc.camel@linaro.org>
Subject: Re: [PATCH v5 02/20] dt-bindings: clock: Add Google gs101 clock
 management unit bindings
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org,  sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com,  linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net,  catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, olof@lixom.net,  gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com,  alim.akhtar@samsung.com
Cc: tudor.ambarus@linaro.org, semen.protsenko@linaro.org,
 saravanak@google.com,  willmcvicker@google.com, soc@kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 kernel-team@android.com,  linux-serial@vger.kernel.org
Date: Wed, 06 Dec 2023 12:30:38 +0000
In-Reply-To: <20231201160925.3136868-3-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
	 <20231201160925.3136868-3-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.49.2-3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Pete,

On Fri, 2023-12-01 at 16:09 +0000, Peter Griffin wrote:
> [...]
> +...
> diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindin=
gs/clock/google,gs101.h
> new file mode 100644
> index 000000000000..9f280f74578a
> --- /dev/null
> +++ b/include/dt-bindings/clock/google,gs101.h
> @@ -0,0 +1,392 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + * Author: Peter Griffin <peter.griffin@linaro.org>
> + *
> + * Device Tree binding constants for Google gs101 clock controller.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_GOOGLE_GS101_H
> +#define _DT_BINDINGS_CLOCK_GOOGLE_GS101_H
> +
> +/* CMU_TOP PLL */
> +#define CLK_FOUT_SHARED0_PLL		1
> +#define CLK_FOUT_SHARED1_PLL		2
> +#define CLK_FOUT_SHARED2_PLL		3
> +#define CLK_FOUT_SHARED3_PLL		4
> +#define CLK_FOUT_SPARE_PLL		5
> +
> +/* CMU_TOP MUX */
> +#define CLK_MOUT_SHARED0_PLL		6
> +#define CLK_MOUT_SHARED1_PLL		7
> +#define CLK_MOUT_SHARED2_PLL		8
> +#define CLK_MOUT_SHARED3_PLL		9
> +#define CLK_MOUT_SPARE_PLL		10
> +#define CLK_MOUT_BO_BUS			11
> +#define CLK_MOUT_BUS0_BUS		12
> +#define CLK_MOUT_BUS1_BUS		13
> +#define CLK_MOUT_BUS2_BUS		14
> +#define CLK_MOUT_CIS_CLK0		15
> +#define CLK_MOUT_CIS_CLK1		16
> +#define CLK_MOUT_CIS_CLK2		17
> +#define CLK_MOUT_CIS_CLK3		18
> +#define CLK_MOUT_CIS_CLK4		19
> +#define CLK_MOUT_CIS_CLK5		20
> +#define CLK_MOUT_CIS_CLK6		21
> +#define CLK_MOUT_CIS_CLK7		22
> +#define CLK_MOUT_CMU_BOOST		23
> +#define CLK_MOUT_BOOST_OPTION1		24
> +#define CLK_MOUT_CORE_BUS		25
> +#define CLK_MOUT_CPUCL0_DBG		26
> +#define CLK_MOUT_CPUCL0_SWITCH		27
> +#define CLK_MOUT_CPUCL1_SWITCH		28
> +#define CLK_MOUT_CPUCL2_SWITCH		29
> +#define CLK_MOUT_CSIS_BUS		30
> +#define CLK_MOUT_DISP_BUS		31
> +#define CLK_MOUT_DNS_BUS		32
> +#define CLK_MOUT_DPU_BUS		33
> +#define CLK_MOUT_EH_BUS			34
> +#define CLK_MOUT_G2D_G2D		35
> +#define CLK_MOUT_G2D_MSCL		36
> +#define CLK_MOUT_G3AA_G3AA		37
> +#define CLK_MOUT_G3D_BUSD		38
> +#define CLK_MOUT_G3D_GLB		39
> +#define CLK_MOUT_G3D_SWITCH		40
> +#define CLK_MOUT_GDC_GDC0		41
> +#define CLK_MOUT_GDC_GDC1		42
> +#define CLK_MOUT_GDC_SCSC		43
> +#define CLK_MOUT_CMU_HPM		44
> +#define CLK_MOUT_HSI0_BUS		45
> +#define CLK_MOUT_HSI0_DPGTC		46
> +#define CLK_MOUT_HSI0_USB31DRD		47
> +#define CLK_MOUT_HSI0_USBDPDGB		48
> +#define CLK_MOUT_HSI1_BUS		49
> +#define CLK_MOUT_HSI1_PCIE		50
> +#define CLK_MOUT_HSI2_BUS		51
> +#define CLK_MOUT_HSI2_MMC_CARD		52
> +#define CLK_MOUT_HSI2_PCIE		53
> +#define CLK_MOUT_HSI2_UFS_EMBD		54
> +#define CLK_MOUT_IPP_BUS		55
> +#define CLK_MOUT_ITP_BUS		56
> +#define CLK_MOUT_MCSC_ITSC		57
> +#define CLK_MOUT_MCSC_MCSC		58
> +#define CLK_MOUT_MFC_MFC		59
> +#define CLK_MOUT_MIF_BUSP		60
> +#define CLK_MOUT_MIF_SWITCH		61
> +#define CLK_MOUT_MISC_BUS		62
> +#define CLK_MOUT_MISC_SSS		63
> +#define CLK_MOUT_PDP_BUS		64
> +#define CLK_MOUT_PDP_VRA		65
> +#define CLK_MOUT_PERIC0_BUS		66
> +#define CLK_MOUT_PERIC0_IP		67
> +#define CLK_MOUT_PERIC1_BUS		68
> +#define CLK_MOUT_PERIC1_IP		69
> +#define CLK_MOUT_TNR_BUS		70
> +#define CLK_MOUT_TOP_BOOST_OPTION1	71
> +#define CLK_MOUT_TOP_CMUREF		72
> +#define CLK_MOUT_TPU_BUS		73
> +#define CLK_MOUT_TPU_TPU		74
> +#define CLK_MOUT_TPU_TPUCTL		75
> +#define CLK_MOUT_TPU_UART		76
> +#define CLK_MOUT_CMU_CMUREF		77
> +
> +/* CMU_TOP Dividers */
> +#define CLK_DOUT_BO_BUS			78
> +#define CLK_DOUT_BUS0_BUS		79
> +#define CLK_DOUT_BUS1_BUS		80
> +#define CLK_DOUT_BUS2_BUS		81
> +#define CLK_DOUT_CIS_CLK0		82
> +#define CLK_DOUT_CIS_CLK1		83
> +#define CLK_DOUT_CIS_CLK2		84
> +#define CLK_DOUT_CIS_CLK3		85
> +#define CLK_DOUT_CIS_CLK4		86
> +#define CLK_DOUT_CIS_CLK5		87
> +#define CLK_DOUT_CIS_CLK6		88
> +#define CLK_DOUT_CIS_CLK7		89
> +#define CLK_DOUT_CORE_BUS		90
> +#define CLK_DOUT_CPUCL0_DBG		91
> +#define CLK_DOUT_CPUCL0_SWITCH		92
> +#define CLK_DOUT_CPUCL1_SWITCH		93
> +#define CLK_DOUT_CPUCL2_SWITCH		94
> +#define CLK_DOUT_CSIS_BUS		95
> +#define CLK_DOUT_DISP_BUS		96
> +#define CLK_DOUT_DNS_BUS		97
> +#define CLK_DOUT_DPU_BUS		98
> +#define CLK_DOUT_EH_BUS			99
> +#define CLK_DOUT_G2D_G2D		100
> +#define CLK_DOUT_G2D_MSCL		101
> +#define CLK_DOUT_G3AA_G3AA		102
> +#define CLK_DOUT_G3D_BUSD		103
> +#define CLK_DOUT_G3D_GLB		104
> +#define CLK_DOUT_G3D_SWITCH		105
> +#define CLK_DOUT_GDC_GDC0		106
> +#define CLK_DOUT_GDC_GDC1		107
> +#define CLK_DOUT_GDC_SCSC		108
> +#define CLK_DOUT_CMU_HPM		109
> +#define CLK_DOUT_HSI0_BUS		110
> +#define CLK_DOUT_HSI0_DPGTC		111
> +#define CLK_DOUT_HSI0_USB31DRD		112
> +#define CLK_DOUT_HSI0_USBDPDGB		113
> +#define CLK_DOUT_HSI1_BUS		114
> +#define CLK_DOUT_HSI1_PCIE		115
> +#define CLK_DOUT_HSI2_BUS		116
> +#define CLK_DOUT_HSI2_MMC_CARD		117
> +#define CLK_DOUT_HSI2_PCIE		118
> +#define CLK_DOUT_HSI2_UFS_EMBD		119
> +#define CLK_DOUT_IPP_BUS		107

You're restarting at 107 here, but the numbers should continue at 120...

> +#define CLK_DOUT_ITP_BUS		108
> +#define CLK_DOUT_MCSC_ITSC		109
> +#define CLK_DOUT_MCSC_MCSC		110
> +#define CLK_DOUT_MFC_MFC		111
> +#define CLK_DOUT_MIF_BUSP		112
> +#define CLK_DOUT_MISC_BUS		113
> +#define CLK_DOUT_MISC_SSS		114
> +#define CLK_DOUT_PDP_BUS		115
> +#define CLK_DOUT_PDP_VRA		116
> +#define CLK_DOUT_PERIC0_BUS		117
> +#define CLK_DOUT_PERIC0_IP		118
> +#define CLK_DOUT_PERIC1_BUS		119
> +#define CLK_DOUT_PERIC1_IP		120
> +#define CLK_DOUT_TNR_BUS		121
> +#define CLK_DOUT_TPU_BUS		122
> +#define CLK_DOUT_TPU_TPU		123
> +#define CLK_DOUT_TPU_TPUCTL		124
> +#define CLK_DOUT_TPU_UART		125
> +#define CLK_DOUT_CMU_BOOST		126
> +#define CLK_DOUT_CMU_CMUREF		127
> +#define CLK_DOUT_SHARED0_DIV2		128
> +#define CLK_DOUT_SHARED0_DIV3		129
> +#define CLK_DOUT_SHARED0_DIV4		130
> +#define CLK_DOUT_SHARED0_DIV5		131
> +#define CLK_DOUT_SHARED1_DIV2		132
> +#define CLK_DOUT_SHARED1_DIV3		133
> +#define CLK_DOUT_SHARED1_DIV4		134
> +#define CLK_DOUT_SHARED2_DIV2		135
> +#define CLK_DOUT_SHARED3_DIV2		136
> +
> +/* CMU_TOP Gates */
> +#define CLK_GOUT_BUS0_BOOST		137
> +#define CLK_GOUT_BUS1_BOOST		138
> +#define CLK_GOUT_BUS2_BOOST		139
> +#define CLK_GOUT_CORE_BOOST		140
> +#define CLK_GOUT_CPUCL0_BOOST		141
> +#define CLK_GOUT_CPUCL1_BOOST		142
> +#define CLK_GOUT_CPUCL2_BOOST		143
> +#define CLK_GOUT_MIF_BOOST		144
> +#define CLK_GOUT_MIF_SWITCH		145
> +#define CLK_GOUT_BO_BUS			146
> +#define CLK_GOUT_BUS0_BUS		147
> +#define CLK_GOUT_BUS1_BUS		148
> +#define CLK_GOUT_BUS2_BUS		149
> +#define CLK_GOUT_CIS_CLK0		150
> +#define CLK_GOUT_CIS_CLK1		151
> +#define CLK_GOUT_CIS_CLK2		152
> +#define CLK_GOUT_CIS_CLK3		153
> +#define CLK_GOUT_CIS_CLK4		154
> +#define CLK_GOUT_CIS_CLK5		155
> +#define CLK_GOUT_CIS_CLK6		156
> +#define CLK_GOUT_CIS_CLK7		157
> +#define CLK_GOUT_CMU_BOOST		158
> +#define CLK_GOUT_CORE_BUS		159
> +#define CLK_GOUT_CPUCL0_DBG		160
> +#define CLK_GOUT_CPUCL0_SWITCH		161
> +#define CLK_GOUT_CPUCL1_SWITCH		162
> +#define CLK_GOUT_CPUCL2_SWITCH		163
> +#define CLK_GOUT_CSIS_BUS		164
> +#define CLK_GOUT_DISP_BUS		165
> +#define CLK_GOUT_DNS_BUS		166
> +#define CLK_GOUT_DPU_BUS		167
> +#define CLK_GOUT_EH_BUS			168
> +#define CLK_GOUT_G2D_G2D		169
> +#define CLK_GOUT_G2D_MSCL		170
> +#define CLK_GOUT_G3AA_G3AA		171
> +#define CLK_GOUT_G3D_BUSD		172
> +#define CLK_GOUT_G3D_GLB		173
> +#define CLK_GOUT_G3D_SWITCH		174
> +#define CLK_GOUT_GDC_GDC0		175
> +#define CLK_GOUT_GDC_GDC1		176
> +#define CLK_GOUT_GDC_SCSC		177
> +#define CLK_GOUT_CMU_HPM		178
> +#define CLK_GOUT_HSI0_BUS		179
> +#define CLK_GOUT_HSI0_DPGTC		180
> +#define CLK_GOUT_HSI0_USB31DRD		181
> +#define CLK_GOUT_HSI0_USBDPDGB		182
> +#define CLK_GOUT_HSI1_BUS		183
> +#define CLK_GOUT_HSI1_PCIE		184
> +#define CLK_GOUT_HSI2_BUS		185
> +#define CLK_GOUT_HSI2_MMC_CARD		186
> +#define CLK_GOUT_HSI2_PCIE		187
> +#define CLK_GOUT_HSI2_UFS_EMBD		188
> +#define CLK_GOUT_IPP_BUS		189
> +#define CLK_GOUT_ITP_BUS		190
> +#define CLK_GOUT_MCSC_ITSC		191
> +#define CLK_GOUT_MCSC_MCSC		192
> +#define CLK_GOUT_MFC_MFC		193
> +#define CLK_GOUT_MIF_BUSP		194
> +#define CLK_GOUT_MISC_BUS		195
> +#define CLK_GOUT_MISC_SSS		196
> +#define CLK_GOUT_PDP_BUS		197
> +#define CLK_GOUT_PDP_VRA		298
> +#define CLK_GOUT_G3AA			299
> +#define CLK_GOUT_PERIC0_BUS		200
> +#define CLK_GOUT_PERIC0_IP		201
> +#define CLK_GOUT_PERIC1_BUS		202
> +#define CLK_GOUT_PERIC1_IP		203
> +#define CLK_GOUT_TNR_BUS		204
> +#define CLK_GOUT_TOP_CMUREF		205
> +#define CLK_GOUT_TPU_BUS		206
> +#define CLK_GOUT_TPU_TPU		207
> +#define CLK_GOUT_TPU_TPUCTL		208
> +#define CLK_GOUT_TPU_UART		209

... up to here. I also checked the other units, they seem to be OK.

Cheers,
Andre'


