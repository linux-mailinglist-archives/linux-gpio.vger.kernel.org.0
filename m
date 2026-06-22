Return-Path: <linux-gpio+bounces-38809-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u9Y5LMgiOWpmnQcAu9opvQ
	(envelope-from <linux-gpio+bounces-38809-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:55:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B4B6AF3E6
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:55:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ihKj47iK;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38809-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38809-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A64030262D7
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA642DE6E3;
	Mon, 22 Jun 2026 11:55:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378012DC32A
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 11:55:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782129342; cv=none; b=iXawSv9zZXqksTzbiCh1atac3Aa35CN6pKkrlyfnkKVh43Zk+hdre42SQi1fDU+z5bzCKiSvkRcVFSke3MaRcZrzq3MFwMGIB07btHMfuZ7tclAQQKONhj9QHEBf1pze+3aAP7qTJIwy8oNCvW5r/oj4HBEce93FbWkItXKfKzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782129342; c=relaxed/simple;
	bh=XT8rZON3uno2HhYM3tpoEU+Ats9CQBPjrBdwm8kbSgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YptYVVByILiZq/EwyrvMq1OQtx1p5EltBHxYTaEMUEMmagzY+ZqS2Ek48L0PixtROKx9LFL+xqyZtyty8MKHwcbHDZA7jAjnPM7MVKa/OK2320siEWQqteKiKVcXwZo47EYJUsPtg8y/TddsZq83Hq7KYiXg/LBFNv2KH+xB+9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihKj47iK; arc=none smtp.client-ip=209.85.222.176
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-920fbdffa31so218229785a.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 04:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782129340; x=1782734140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+QfWqJpMHzqjlN+uo9udP0Tr71dK+AMMQweieefzuM=;
        b=ihKj47iKmq7xKb+N054W00P60mCNadtjvc/7SLo9obMHEDfSwXQKJsU2XMiq25BL+g
         XoYvKWcMR4epCVqZXwvlD4K8ho96PELeKDT+UTSysuPSSSeDIWGE6x0lgbW0e+gOiXee
         cTr3HH4BRuZeRwnScSrac/yw4eRWOlRSrzU7jLkajuF75UJDzkT/v8Hwd0NNzFD3DMR7
         Nqa7FAUvMMGkdZL3q2/MqwB8r7h7wG9jdea1dhjbEizRPs9B31fa14J/rSJD/5rwYAeT
         DIoq/A5c+R3XFelqo+rlud/K9xRItVJj3fDOoqkXil/WGq3ysM9FrU52rED5jxzJ9LJf
         mcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782129340; x=1782734140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o+QfWqJpMHzqjlN+uo9udP0Tr71dK+AMMQweieefzuM=;
        b=kko87a4QsUGlT73obQ+9gVJ3QPt7xz5Q/W+mXd7juY+QoQCCkUJN1bsCm/axaSCbm/
         PiJDG+99Mi1W5igwNs41vw83yWy/QXc70uRHeDQNbiMU2QMRzAPKsFsQN3e3ryypRL/p
         Fc95AjUHa8TGNiinrfRqhAt1Cg+B1IP+7CDEaFLt1THkAnWTpLuRHs9W38+557QBtWnf
         dDcIVOO0PKOfnSGymA9tZLzJ+PYJAjRik+Qb2eRhTcNUfY6m+aXLbYYwhljVGL4KYuDZ
         tgC/RKflfxM7lk8BYpDDkBJ+RKdPHRnKK/mw847rF5Wh/wQUbHNQGod9QEMu4nkbl8e/
         2gGg==
X-Forwarded-Encrypted: i=1; AFNElJ9O+1KqPXyHQTRTIlzG0lb8Ea2gp5OSYyFYqA7IXIE9t1zHPpqtxlnHoO+G6iugeRP5FO8M31s8cgUu@vger.kernel.org
X-Gm-Message-State: AOJu0YzvHPHzW0/6ERqjqCXY2ZLoMlbLXc1PyoNSSoBQp8n5N9hqm1RZ
	xbaX2qqnyl7dogFNjw7X6V68yGBmdZm+NqrzUtMft7kR/RH8gkEhFw4=
X-Gm-Gg: AfdE7cmBdqIXrpLuUfst7otBMVgXmTNgXOM9oLQYDsM35UC2p+R5hVCJ6ObestOScDz
	sTEEYnG1H/kFOMNNFiiHbrxN7hhSx6j1/9p2sYVX72g4PV7qKdTtudcb6ysYK2BCcerTqeRPYHf
	vS2Jg+dCH6II+HQ6H7gIVxIkGrheVs4Alep4x3V9pK2+L0NSd8ERm+35khKj43dKuzlzmeQKMsa
	csvm1wWlHGuBCO01Ao2xK7DJnC3nAKI1cyLOEqMOWTykOHWgGF6JQmgsdWcabVUdOxzHEeez610
	YG6dwX1J6c6MJNLUvR2c3H4mow2DLmpt+lmssltvpD4kEYdp047CWUzyjg1Oh05FKAyVVZzA146
	dE9YhS3APipnV6hHMfAK057F6fq2RczisfzGUab/PHmY5cA1sCMm4kb7k6SKI2ShOaSWeC4KKkz
	p2XJpmbUtg0d5aaAuaFtK3C4UODgb7nGcb41WYsKwKbg==
X-Received: by 2002:a05:620a:2419:20b0:922:e670:9e83 with SMTP id af79cd13be357-922e6709ff3mr777571185a.42.1782129340108;
        Mon, 22 Jun 2026 04:55:40 -0700 (PDT)
Received: from matheus-note.localnet ([2804:7f0:bac3:7a3e:53ef:6965:d89d:38da])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-921db06174dsm903425485a.33.2026.06.22.04.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 04:55:39 -0700 (PDT)
From: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Markus Gothe <markus.gothe@genexis.eu>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: Re: [PATCH v5 16/16] pinctrl: airoha: add support of an7563 SoC
Date: Mon, 22 Jun 2026 08:55:33 -0300
Message-ID: <kNxYkw2WQ92M6zgbpnkZ0w@gmail.com>
In-Reply-To: <20260622113046.3619139-17-mikhail.kshevetskiy@iopsys.eu>
References:
 <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
 <20260622113046.3619139-17-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38809-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:mikhail.kshevetskiy@iopsys.eu,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org,iopsys.eu];
	FORGED_SENDER(0.00)[srherobrine20@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srherobrine20@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05B4B6AF3E6

Em segunda-feira, 22 de junho de 2026, =C3=A0s 08:30:46 Hor=C3=A1rio Padr=
=C3=A3o de Bras=C3=ADlia,=20
Mikhail Kshevetskiy escreveu:
> +/*
> + * shared - named RG_SW_TOD_1PPS_MODE on AN7563. Only the LAN LED mode
> + * bits and GSW_TOD_1PPS exist on AN7563 (no 2nd I2C, I2S or PON 1PPS).
> + */
> +#define REG_GPIO_2ND_I2C_MODE                  0x0214
> +#define GPIO_LAN3_LED1_MODE_MASK               BIT(10)
> +#define GPIO_LAN3_LED0_MODE_MASK               BIT(9)
> +#define GPIO_LAN2_LED1_MODE_MASK               BIT(8)
> +#define GPIO_LAN2_LED0_MODE_MASK               BIT(7)
> +#define GPIO_LAN1_LED1_MODE_MASK               BIT(6)
> +#define GPIO_LAN1_LED0_MODE_MASK               BIT(5)
> +#define GPIO_LAN0_LED1_MODE_MASK               BIT(4)
> +#define GPIO_LAN0_LED0_MODE_MASK               BIT(3)
> +#define GSW_TOD_1PPS_MODE_MASK                 BIT(1)
> +
> +/* shared */
> +#define REG_GPIO_SPI_CS1_MODE                  0x0218
> +#define GPIO_PCM_SPI_CS4_MODE_MASK             BIT(21)
> +#define GPIO_PCM_SPI_CS3_MODE_MASK             BIT(20)
> +#define GPIO_PCM_SPI_CS2_MODE_MASK             BIT(18)
> +#define GPIO_PCM_SPI_CS1_MODE_MASK             BIT(17)
> +#define GPIO_PCM_SPI_MODE_MASK                 BIT(16)
> +#define GPIO_PCM2_MODE_MASK                    BIT(13)
> +#define GPIO_PCM1_MODE_MASK                    BIT(12)
> +#define GPIO_PCM_INT_MODE_MASK                 BIT(9)
> +#define GPIO_PCM_RESET_MODE_MASK               BIT(8)
> +#define GPIO_SPI_QUAD_MODE_MASK                        BIT(4)
> +#define GPIO_SPI_CS4_MODE_MASK                 BIT(3)
> +#define GPIO_SPI_CS3_MODE_MASK                 BIT(2)
> +#define GPIO_SPI_CS2_MODE_MASK                 BIT(1)
> +#define GPIO_SPI_CS1_MODE_MASK                 BIT(0)
> +
> +#define REG_GPIO_PON_MODE                      0x021c
> +/*
> + * AN7563 specific: route the standalone pads to their GPIO function.
> + * 0: pad keeps its base function, 1: pad is GPIO<n>.
> + */
> +#define UART_RXD_GPIO_MODE_MASK                        BIT(22) /* GPIO37=
 */
> +#define UART_TXD_GPIO_MODE_MASK                        BIT(21) /* GPIO36
> */ +#define SPI_MISO_GPIO_MODE_MASK                        BIT(20) /*
> GPIO35 */ +#define SPI_MOSI_GPIO_MODE_MASK                        BIT(19)
> /* GPIO34 */ +#define SPI_CS_GPIO_MODE_MASK                  BIT(18) /*
> GPIO33 */ +#define SPI_CLK_GPIO_MODE_MASK                 BIT(17) /* GPIO=
32
> */ +#define I2C_SDA_GPIO_MODE_MASK                 BIT(16) /* GPIO31 */
> +#define I2C_SCL_GPIO_MODE_MASK                 BIT(15) /* GPIO30 */ +/*
> shared */
> +#define GPIO_PARALLEL_NAND_MODE_MASK           BIT(14)
> +#define GPIO_SGMII_MDIO_MODE_MASK              BIT(13)
> +#define SIPO_RCLK_MODE_MASK                    BIT(11)
> +/*
> + * Note: on AN7563 GPIO_PCIE_RESET{0,1} select the GPIO function of the
> + * PCIE_RESET pads (0: PCIe reset, 1: GPIO28/GPIO29).
> + */
> +#define GPIO_PCIE_RESET1_MASK                  BIT(10) /* GPIO29 */
> +#define GPIO_PCIE_RESET0_MASK                  BIT(9)  /* GPIO28 */
> +#define GPIO_HSUART_CTS_RTS_MODE_MASK          BIT(6)
> +#define GPIO_HSUART_MODE_MASK                  BIT(5)
> +#define GPIO_SIPO_MODE_MASK                    BIT(2)
> +#define GPIO_PON_MODE_MASK                     BIT(0)
> +
> +/* shared */
> +#define REG_NPU_UART_EN                                0x0224
> +#define JTAG_UDI_EN_MASK                       BIT(4)
> +#define JTAG_DFD_EN_MASK                       BIT(3)
> +
> +/* LED MAP - shared */
> +#define REG_LAN_LED0_MAPPING                   0x027c
> +#define REG_LAN_LED1_MAPPING                   0x0280
> +
> +#define LAN3_LED_MAPPING_MASK                  GENMASK(14, 12)
> +#define LAN3_PHY_LED_MAP(_n)                 =20
> FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, (_n)) +
> +#define LAN2_LED_MAPPING_MASK                  GENMASK(10, =F0=9F=98=8E
> +#define LAN2_PHY_LED_MAP(_n)                 =20
> FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, (_n)) +
> +#define LAN1_LED_MAPPING_MASK                  GENMASK(6, 4)
> +#define LAN1_PHY_LED_MAP(_n)                 =20
> FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, (_n)) +
> +#define LAN0_LED_MAPPING_MASK                  GENMASK(2, 0)
> +#define LAN0_PHY_LED_MAP(_n)                 =20
> FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, (_n)) +
> +/*
> + * CONF - shared.
> + * The AN7563 standalone IO conf registers use the same bit layout as
> + * EN7581 (UART1_TXD/RXD are named UART_TXD/RXD on AN7563).
> + */
> +#define REG_I2C_SDA_E2                         0x001c
> +#define SPI_MISO_E2_MASK                       BIT(14)
> +#define SPI_MOSI_E2_MASK                       BIT(13)
> +#define SPI_CLK_E2_MASK                                BIT(12)
> +#define SPI_CS0_E2_MASK                                BIT(11)
> +#define PCIE1_RESET_E2_MASK                    BIT(9)
> +#define PCIE0_RESET_E2_MASK                    BIT(8)
> +#define UART1_RXD_E2_MASK                      BIT(3)
> +#define UART1_TXD_E2_MASK                      BIT(2)
> +#define I2C_SCL_E2_MASK                                BIT(1)
> +#define I2C_SDA_E2_MASK                                BIT(0)
> +
> +#define REG_I2C_SDA_E4                         0x0020
> +#define SPI_MISO_E4_MASK                       BIT(14)
> +#define SPI_MOSI_E4_MASK                       BIT(13)
> +#define SPI_CLK_E4_MASK                                BIT(12)
> +#define SPI_CS0_E4_MASK                                BIT(11)
> +#define PCIE1_RESET_E4_MASK                    BIT(9)
> +#define PCIE0_RESET_E4_MASK                    BIT(8)
> +#define UART1_RXD_E4_MASK                      BIT(3)
> +#define UART1_TXD_E4_MASK                      BIT(2)
> +#define I2C_SCL_E4_MASK                                BIT(1)
> +#define I2C_SDA_E4_MASK                                BIT(0)
> +
> +#define REG_GPIO_L_E2                          0x0024
> +#define REG_GPIO_L_E4                          0x0028
> +
> +#define REG_I2C_SDA_PU                         0x0044
> +#define SPI_MISO_PU_MASK                       BIT(14)
> +#define SPI_MOSI_PU_MASK                       BIT(13)
> +#define SPI_CLK_PU_MASK                                BIT(12)
> +#define SPI_CS0_PU_MASK                                BIT(11)
> +#define PCIE1_RESET_PU_MASK                    BIT(9)
> +#define PCIE0_RESET_PU_MASK                    BIT(8)
> +#define UART1_RXD_PU_MASK                      BIT(3)
> +#define UART1_TXD_PU_MASK                      BIT(2)
> +#define I2C_SCL_PU_MASK                                BIT(1)
> +#define I2C_SDA_PU_MASK                                BIT(0)
> +
> +#define REG_I2C_SDA_PD                         0x0048
> +#define SPI_MISO_PD_MASK                       BIT(14)
> +#define SPI_MOSI_PD_MASK                       BIT(13)
> +#define SPI_CLK_PD_MASK                                BIT(12)
> +#define SPI_CS0_PD_MASK                                BIT(11)
> +#define PCIE1_RESET_PD_MASK                    BIT(9)
> +#define PCIE0_RESET_PD_MASK                    BIT(8)
> +#define UART1_RXD_PD_MASK                      BIT(3)
> +#define UART1_TXD_PD_MASK                      BIT(2)
> +#define I2C_SCL_PD_MASK                                BIT(1)
> +#define I2C_SDA_PD_MASK                                BIT(0)
> +
> +#define REG_GPIO_L_PU                          0x004c
> +#define REG_GPIO_L_PD                          0x0050
> +
> +#define REG_PCIE_RESET_OD                      0x018c
> +#define PCIE1_RESET_OD_MASK                    BIT(1)
> +#define PCIE0_RESET_OD_MASK                    BIT(0)
> +
> +/*
> + * PWM MODE CONF - shared.
> + * The AN7563 GPIO flash mode registers use the same layout as EN7581:
> + * REG_GPIO_FLASH_MODE_CFG covers GPIO0-15, REG_GPIO_FLASH_MODE_CFG_EXT
> + * covers GPIO16-31 (bits 0-15) and GPIO36+ (bits 16+). The SPI pads
> + * (GPIO32-35) have no flash mode configuration bit.
> + */
> +#define REG_GPIO_FLASH_MODE_CFG                        0x0034
> +#define GPIO15_FLASH_MODE_CFG                  BIT(15)
> +#define GPIO14_FLASH_MODE_CFG                  BIT(14)
> +#define GPIO13_FLASH_MODE_CFG                  BIT(13)
> +#define GPIO12_FLASH_MODE_CFG                  BIT(12)
> +#define GPIO11_FLASH_MODE_CFG                  BIT(11)
> +#define GPIO10_FLASH_MODE_CFG                  BIT(10)
> +#define GPIO9_FLASH_MODE_CFG                   BIT(9)
> +#define GPIO8_FLASH_MODE_CFG                   BIT(8)
> +#define GPIO7_FLASH_MODE_CFG                   BIT(7)
> +#define GPIO6_FLASH_MODE_CFG                   BIT(6)
> +#define GPIO5_FLASH_MODE_CFG                   BIT(5)
> +#define GPIO4_FLASH_MODE_CFG                   BIT(4)
> +#define GPIO3_FLASH_MODE_CFG                   BIT(3)
> +#define GPIO2_FLASH_MODE_CFG                   BIT(2)
> +#define GPIO1_FLASH_MODE_CFG                   BIT(1)
> +#define GPIO0_FLASH_MODE_CFG                   BIT(0)
> +
> +#define REG_GPIO_FLASH_MODE_CFG_EXT            0x0068
> +#define GPIO37_FLASH_MODE_CFG                  BIT(17)
> +#define GPIO36_FLASH_MODE_CFG                  BIT(16)
> +#define GPIO31_FLASH_MODE_CFG                  BIT(15)
> +#define GPIO30_FLASH_MODE_CFG                  BIT(14)
> +#define GPIO29_FLASH_MODE_CFG                  BIT(13)
> +#define GPIO28_FLASH_MODE_CFG                  BIT(12)
> +#define GPIO27_FLASH_MODE_CFG                  BIT(11)
> +#define GPIO26_FLASH_MODE_CFG                  BIT(10)
> +#define GPIO25_FLASH_MODE_CFG                  BIT(9)
> +#define GPIO24_FLASH_MODE_CFG                  BIT(8)
> +#define GPIO23_FLASH_MODE_CFG                  BIT(7)
> +#define GPIO22_FLASH_MODE_CFG                  BIT(6)
> +#define GPIO21_FLASH_MODE_CFG                  BIT(5)
> +#define GPIO20_FLASH_MODE_CFG                  BIT(4)
> +#define GPIO19_FLASH_MODE_CFG                  BIT(3)
> +#define GPIO18_FLASH_MODE_CFG                  BIT(2)
> +#define GPIO17_FLASH_MODE_CFG                  BIT(1)
> +#define GPIO16_FLASH_MODE_CFG                  BIT(0)
> +
> +#define AIROHA_PINCTRL_GPIO(gpio, mux_val)                     \
> +       {                                                       \
> +               .name =3D (gpio),                                 \
> +               .regmap[0] =3D {                                  \
> +                       AIROHA_FUNC_MUX,                        \
> +                       REG_GPIO_PON_MODE,                      \
> +                       (mux_val),                              \
> +                       (mux_val)                               \
> +               },                                              \
> +               .regmap_size =3D 1,                               \
> +       }
> +
> +#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)       \
> +       {                                                       \
> +               .name =3D (gpio),                                 \
> +               .regmap[0] =3D {                                  \
> +                       AIROHA_FUNC_PWM_EXT_MUX,                \
> +                       REG_GPIO_FLASH_MODE_CFG_EXT,            \
> +                       (mux_val),                              \
> +                       0                                       \
> +               },                                              \
> +               .regmap[1] =3D {                                  \
> +                       AIROHA_FUNC_MUX,                        \
> +                       REG_GPIO_PON_MODE,                      \
> +                       (smux_val),                             \
> +                       (smux_val)                              \
> +               },                                              \
> +               .regmap_size =3D 2,                               \
> +       }
> +
> +/* PWM */
> +#define AIROHA_PINCTRL_PWM(gpio, mux_val)                      \
> +       {                                                       \
> +               .name =3D (gpio),                                 \
> +               .regmap[0] =3D {                                  \
> +                       AIROHA_FUNC_PWM_MUX,                    \
> +                       REG_GPIO_FLASH_MODE_CFG,                \
> +                       (mux_val),                              \
> +                       (mux_val)                               \
> +               },                                              \
> +               .regmap_size =3D 1,                               \
> +       }
> +
> +#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)                  \
> +       {                                                       \
> +               .name =3D (gpio),                                 \
> +               .regmap[0] =3D {                                  \
> +                       AIROHA_FUNC_PWM_EXT_MUX,                \
> +                       REG_GPIO_FLASH_MODE_CFG_EXT,            \
> +                       (mux_val),                              \
> +                       (mux_val)                               \
> +               },                                              \
> +               .regmap_size =3D 1,                               \
> +       }
> +
> +#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)    \
> +       {                                                       \
> +               .name =3D (gpio),                                 \
> +               .regmap[0] =3D {                                  \
> +                       AIROHA_FUNC_PWM_EXT_MUX,                \
> +                       REG_GPIO_FLASH_MODE_CFG_EXT,            \
> +                       (mux_val),                              \
> +                       (mux_val)                               \
> +               },                                              \
> +               .regmap[1] =3D {                                  \
> +                       AIROHA_FUNC_MUX,                        \
> +                       REG_GPIO_PON_MODE,                      \
> +                       (smux_val),                             \
> +                       (smux_val)                              \
> +               },                                              \
> +               .regmap_size =3D 2,                               \
> +       }
> +
> +#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)      \
> +       {                                                               \
> +               .name =3D (gpio),                                        =
 \
> +               .regmap[0] =3D {                                         =
 \
> +                       AIROHA_FUNC_MUX,                                \
> +                       REG_GPIO_2ND_I2C_MODE,                          \
> +                       (mux_val),                                      \
> +                       (mux_val),                                      \
> +               },                                                      \
> +               .regmap[1] =3D {                                         =
 \
> +                       AIROHA_FUNC_MUX,                                \
> +                       REG_LAN_LED0_MAPPING,                           \
> +                       (map_mask),                                     \
> +                       (map_val),                                      \
> +               },                                                      \
> +               .regmap_size =3D 2,                                      =
 \
> +       }
> +
> +#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)      \
> +       {                                                               \
> +               .name =3D (gpio),                                        =
 \
> +               .regmap[0] =3D {                                         =
 \
> +                       AIROHA_FUNC_MUX,                                \
> +                       REG_GPIO_2ND_I2C_MODE,                          \
> +                       (mux_val),                                      \
> +                       (mux_val),                                      \
> +               },                                                      \
> +               .regmap[1] =3D {                                         =
 \
> +                       AIROHA_FUNC_MUX,                                \
> +                       REG_LAN_LED1_MAPPING,                           \
> +                       (map_mask),                                     \
> +                       (map_val),                                      \
> +               },                                                      \
> +               .regmap_size =3D 2,                                      =
 \
> +       }

These defines are similar to what we have in airoha-common.h, whatever is n=
ot=20
the same add the define with the prefix and the defines that exist only hav=
e a=20
different regmap, move to the add in the define parameter, do as was done i=
n=20
en7523



