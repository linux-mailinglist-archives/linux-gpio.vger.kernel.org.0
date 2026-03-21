Return-Path: <linux-gpio+bounces-33973-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHvmL02ivmmLVAMAu9opvQ
	(envelope-from <linux-gpio+bounces-33973-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 14:51:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 496AD2E59EF
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 14:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8C1530157CF
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 13:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B974277C81;
	Sat, 21 Mar 2026 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbRRxNvM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e53JOUzf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5773033C0
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774101059; cv=none; b=hGKO3ygNOHd5ykQfWSb/reBQ6GW1jfizfbVLEBmpmLG+SAY/TkaiUUVZKMIbqq6tDFyZqU7vp8AdiPyHc/3aAt0obpxCnPv1cHC1l2k12yX3J4aAuZpW7NKoX/NYL80fpPZ8g8krXXJnL5DY+ofVwup0o9lNsM1jkxohRsc9Q6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774101059; c=relaxed/simple;
	bh=92OGINrYIEMHF4Yj1z89XucWCdQo5x7PD93rkEDJkSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pGH4j/5C1BPizRpjGsaSBm45fhFbYgEaJ+C6ShEOsR651FspRhsfTgr2gvpeOdFDxInLYepugFpxZQbhqZZjpO5GYGzi9vCouXSODVOpnhrB14VKMOBR6vVnU/06nbduZP7sXBQxDVu+Td101nS0CAYsDY943ra49Nyss+i2y64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbRRxNvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e53JOUzf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L3jvHg355145
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 13:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dEwv3v4fvUI
	ft8JTog2rIO4fgOp9tun/AvsOV/PcgME=; b=YbRRxNvMbb0bTnKuOUFNjAugrSH
	mbQgzEOVLCNBcbkGentXKXdqKynHhMwdukdelNCMGRLNOdLW8c2AjK+yCiWNKxTU
	SHCDL/h1sX+ZI0t2FrZSpy5X7lOW6B1vGWGfcibHcuqrCgxe4avSPI06cAKMW0VJ
	z749n+4JhMP5MmwmU3EdC6Y6r/7Q+yNh7w55FE8BPyXyyPTW6GWNz2ZRplGTBA3y
	rhiGnGDuiNpUKaGMCCRyOuaE+OzMJgNXo7ncQkDb5BAbLVuJ0nGn3ODGnjF/Xozd
	oIp/Vwz3QuNV38WA3if0WMB/8k8+49WXHcPLSRpnLxS9Pndyvt0TNVWsTPg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5rrkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 13:50:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b04911610fso34508655ad.3
        for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774101056; x=1774705856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEwv3v4fvUIft8JTog2rIO4fgOp9tun/AvsOV/PcgME=;
        b=e53JOUzfRn7jhJ+kfuFsXrL30/aN2GdF1GOQQjbq/O+jcCVchT5TCjr64ihysT0nJR
         nu0lyfuI+ssnk5Twi8esR7WmxWQ7Fl7vMZb/fPbX4KDpxe0tZGK6Es7u4124RgcB124n
         nFieDFP0dgVM6nxCIVhOBKei4UM6e/g6geOiHbp8NI6qG5HSpkjQFN5gDx4RbOaKmJzy
         lYK5rKpLcPHNiOvMlZ2bZQfusKfAXtjFPl5tZFaftX9/DFkYHYgRvVFlNNPntNlvCCTf
         4MgEfIaQDXFqoWcRdx5oKSl3ELexHXTDw6Ss1qHEbdQ4VoGbtnMOvfmDFVU4dw08aupY
         28CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774101056; x=1774705856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dEwv3v4fvUIft8JTog2rIO4fgOp9tun/AvsOV/PcgME=;
        b=bvxGiO56kFH3M07oO3di/SggMEznPb0bceYZntjtm8Uu84tbceZFSR35tW+ei5SAB6
         Ogv6z8PLl674oSx8V6aG+kym+NlPvZ+FESxqNDJboJ7tiMhYB8ZuA9hhAOMnuIuC9Bme
         Hg897ue22p2fEj8DOFXL9EbAoyQ4mfUNvrE3UfUU+iR6fdhuUflq7wcoPheANoh04E5W
         9LLmoTODHm5v1W/vS9ItpOlZBESjEopPjn2/IV16VLMhXGwMNADhyZ7v7M54u1m8DUgW
         SnUeCdTU6PEHSdCakbmOF+IQfMP9kMx0FWPYVucO2wvSuIMtejO8vqc2ERBfp/+OtLeI
         I9eg==
X-Forwarded-Encrypted: i=1; AJvYcCWQAd08tpYEhC6nUZ2V/3R98aGlwS+1edpv1zjMtNPL3J6QgjpjydbkCRWw2Yky+3NjworNvD16tKmr@vger.kernel.org
X-Gm-Message-State: AOJu0YyFChnuAe8hyAXNGy5KZde1xn5QLEsZNxEFopBNy5dSk1qh5lNw
	Xwyxmfacf1bRXwXuPb33mDrSmUo9/nRlXQR6pALJT4CU4U7BtJPESxFSBOEp9OqQUVJKzVcZPLU
	7JxIiw1s1pZwk8rMqtxi5jWzAjFKkp6nVHb09yx3aw3E5ISQPjqkIBERvzZJeYdQW
X-Gm-Gg: ATEYQzxHf3KilATcQe5l3MbQ41S7fW/wm24swMX/A0IukpzH7GyX8M/VQgLeh9S3lw7
	8B30+Rr1lbps/ByaRvc4boxVLWFasFiTHK+pFu3qMLfI7jY2AgX60bS9AQH8hZLwv8eOD55oR2R
	c2+4ICmIqr0tp5860Wuaqgiv4FgpPoD3kumwjVbqx3XkLkVzxzZbpY6dwIjU62nHL+ZmXTWt1OQ
	TXdhvvFeczvyKkYa9+Mccx8bSZgdqXwjdicu3YbAoH73f34/jcYANoRAnsc9C0jno2kDipRp0yd
	TEwiP+tU5h/nbHDT2c2O9+zJvneiJJ4VDsO76oCSytn8gGBrifUqKBwvkTyFmK6h0kO8ceJsczq
	WT4mLEE+ZfJx0lojzkZt4szGBdZSCbc4ZSzFN9prfPJQ9uLaD31Cnuva8UQ==
X-Received: by 2002:a17:902:e551:b0:2ae:c9be:5f30 with SMTP id d9443c01a7336-2b0827898f7mr62267115ad.23.1774101055705;
        Sat, 21 Mar 2026 06:50:55 -0700 (PDT)
X-Received: by 2002:a17:902:e551:b0:2ae:c9be:5f30 with SMTP id d9443c01a7336-2b0827898f7mr62266925ad.23.1774101055240;
        Sat, 21 Mar 2026 06:50:55 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516cb9sm54897555ad.2.2026.03.21.06.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:50:54 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linusw@kernel.org, brgl@kernel.org, linux-can@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v3 2/2] can: mcp251xfd: add support for XSTBYEN transceiver standby control
Date: Sat, 21 Mar 2026 19:20:31 +0530
Message-Id: <20260321135031.3107408-3-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
References: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69bea240 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=K7bTvPR2ScrnO788fwgA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDExNSBTYWx0ZWRfX6mRWwapKrkiu
 TVGnlmcVXS1+Dl2d1ml8oHWYK1Do9wCSxK/3YMddvPpLecpzmPez+zh9UWyqVF5yTnD84NmYe9+
 83815iQWwNyiGfrMMBiynG3yW93Wvyhdo99BssRvn6MeP7nKyZATtwV4QAe3kH+amz5DHcU1JM3
 Smfn0q8DeFuWvhGuGXBrqIZ/Ha1svnxa5+69hDo8hihBb6YVQeJowsWyf2AbhQyU2NzTp0h2xHG
 imY+aEVGvhHQm4ECg0RiLItcpVsUC6cdK9onVhc5oDLkmEvrruKO1P8O/abswwJvbpIG+YiXL1Y
 Dj40hzHDXeJ8fSlW7IIO5xM1s+rzEjrtR+EkNQ02bWXR38LnpyFJx8LjGQi5DSQnby5im3NGONg
 P9Z5Qg2zjScg1Xx7iKhgShpPK5SCsCc/GsHfBkaz8G3iWIZqPPzhI8IJ4oE9X+3hrdeYKo3erb/
 qOho4iwriUw2gsGv4Jw==
X-Proofpoint-ORIG-GUID: iK6KZp72rcExOtYThFWPCi8WejbHAJlm
X-Proofpoint-GUID: iK6KZp72rcExOtYThFWPCi8WejbHAJlm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603210115
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33973-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 496AD2E59EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MCP251xFD has a dedicated transceiver standby control function on
the INT0/GPIO0/XSTBY pin, controlled by the XSTBYEN bit in IOCON.
When enabled, the hardware automatically manages the transceiver
standby state: the pin is driven low when the controller is active
and high when it enters Sleep mode.

Enable this feature when the 'microchip,xstbyen' device tree property
is present.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
v2 -> v3:

- Configure xstbyen pin before bringing the controller into normal mode.
- Add a check in mcp251xfd_gpio_request() to ensure that GPIO0 cannot be
  used when xstbyen is enabled.

v2 Link: https://lore.kernel.org/all/20260316131950.859748-3-viken.dadhaniya@oss.qualcomm.com/
---
 .../net/can/spi/mcp251xfd/mcp251xfd-core.c    | 37 +++++++++++++++++++
 drivers/net/can/spi/mcp251xfd/mcp251xfd.h     |  1 +
 2 files changed, 38 insertions(+)

diff --git a/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c b/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
index 9c86df08c2c5..92a86083c896 100644
--- a/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
+++ b/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
@@ -764,6 +764,31 @@ static void mcp251xfd_chip_stop(struct mcp251xfd_priv *priv,
 	mcp251xfd_chip_set_mode(priv, MCP251XFD_REG_CON_MODE_CONFIG);
 }
 
+static int mcp251xfd_chip_xstbyen_enable(const struct mcp251xfd_priv *priv)
+{
+	/* Configure the INT0/GPIO0/XSTBY pin as transceiver standby control:
+	 *
+	 * - XSTBYEN=1: route the pin to the transceiver standby function
+	 * - TRIS0=0:   set output direction; the reset default is 1 (input),
+	 *              which leaves the pin floating HIGH and keeps the
+	 *              transceiver in standby regardless of XSTBYEN
+	 * - LAT0=0:    drive pin LOW => transceiver active (not in standby)
+	 *
+	 * All three bits are included in the mask; only XSTBYEN is set in
+	 * val, so TRIS0 and LAT0 are cleared to 0 atomically.
+	 *
+	 * Pin behaviour by mode:
+	 * - Config mode: controlled by LAT0 (LAT0=0 => LOW => active)
+	 * - Normal mode: hardware drives pin LOW (active)
+	 * - Sleep mode:  hardware drives pin HIGH (standby)
+	 */
+	return regmap_update_bits(priv->map_reg, MCP251XFD_REG_IOCON,
+				  MCP251XFD_REG_IOCON_XSTBYEN |
+				  MCP251XFD_REG_IOCON_TRIS0 |
+				  MCP251XFD_REG_IOCON_LAT0,
+				  MCP251XFD_REG_IOCON_XSTBYEN);
+}
+
 static int mcp251xfd_chip_start(struct mcp251xfd_priv *priv)
 {
 	int err;
@@ -796,6 +821,12 @@ static int mcp251xfd_chip_start(struct mcp251xfd_priv *priv)
 
 	priv->can.state = CAN_STATE_ERROR_ACTIVE;
 
+	if (priv->xstbyen) {
+		err = mcp251xfd_chip_xstbyen_enable(priv);
+		if (err)
+			goto out_chip_stop;
+	}
+
 	err = mcp251xfd_chip_set_normal_mode(priv);
 	if (err)
 		goto out_chip_stop;
@@ -1805,6 +1836,11 @@ static int mcp251xfd_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	u32 pin_mask = MCP251XFD_REG_IOCON_PM(offset);
 	int ret;
 
+	if (priv->xstbyen && offset == 0) {
+		netdev_err(priv->ndev, "Can't use GPIO 0 with XSTBYEN!\n");
+		return -EINVAL;
+	}
+
 	if (priv->rx_int && offset == 1) {
 		netdev_err(priv->ndev, "Can't use GPIO 1 with RX-INT!\n");
 		return -EINVAL;
@@ -2271,6 +2307,7 @@ static int mcp251xfd_probe(struct spi_device *spi)
 	priv->pll_enable = pll_enable;
 	priv->reg_vdd = reg_vdd;
 	priv->reg_xceiver = reg_xceiver;
+	priv->xstbyen = device_property_present(&spi->dev, "microchip,xstbyen");
 	priv->devtype_data = *(struct mcp251xfd_devtype_data *)spi_get_device_match_data(spi);
 
 	/* Errata Reference:
diff --git a/drivers/net/can/spi/mcp251xfd/mcp251xfd.h b/drivers/net/can/spi/mcp251xfd/mcp251xfd.h
index 085d7101e595..d3f4704e2678 100644
--- a/drivers/net/can/spi/mcp251xfd/mcp251xfd.h
+++ b/drivers/net/can/spi/mcp251xfd/mcp251xfd.h
@@ -672,6 +672,7 @@ struct mcp251xfd_priv {
 	struct gpio_desc *rx_int;
 	struct clk *clk;
 	bool pll_enable;
+	bool xstbyen;
 	struct regulator *reg_vdd;
 	struct regulator *reg_xceiver;
 
-- 
2.34.1


