Return-Path: <linux-gpio+bounces-34441-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILYGCoOpymmx+gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34441-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 18:49:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4D235F031
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 18:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ADB7D3019E0A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 16:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D6A3DB654;
	Mon, 30 Mar 2026 16:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSSxKt8Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19A33DA7F7
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889203; cv=none; b=lfMzr1QgHNQH9ZSz8TXU4lEEDOhn2ZCVnDel0rOMVi/lZJ8La5Z9L8SlL+hucDCk9DzFZa1QnNpE3DfIpvo7mf4YOqOt0MEJAEKeKC9qEgIDWoRxmK/wVnI/tgZG1qpWYaVxrtAyyhOTKjX+HK3ewXr5GOuWfcdar9A688hIrS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889203; c=relaxed/simple;
	bh=Gi6HmcrGUdEENDhayZL8hj+zJbPt1IWORHxWpEbGYgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuPWkdaHbsDsTtphdntfraipNJacwPOmz2dthrl+biBEwJA4/zf57AZbidyNiGVQ3J1oC81SRqb5Tw2LNLpGt/Cm3OnlidoroFnmA5pUmTdNyxQQXyTwguelME/6EGX5C+fNh1xnWLMcqXfmGuTTFxnqsjuHKiYVwZRGXmSF/jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSSxKt8Z; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89f68634786so24797076d6.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889201; x=1775494001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSdVMxdN9m3u1teXqd0BR51kR0qUNsC9d7n260thy48=;
        b=PSSxKt8Z8Lsjf65VPPnFkckNPeD29wfCOKd1q/fYAKFQtTxaaOICOdjMysD5x+Ctaj
         kZNT7RITHMDHoQyHJmvlx0q0q40ttc/3TW/6+h7qKztYVb1GOa+Mcw1zXYUpEaCKE7wj
         /CiyH6nYiSExr2RfIeXFivNOvVeb4j5lAZmkpr66D9ZNT5ir1FKC4BBt/MIQ9+k78Kv1
         QdN+7Sq+pPB2iCitwGW0nMpzY/Xvd70Z0HcRnP5QYpWOneW6aBf57Gy11/IrlHeSzF7m
         nfTAQRe+AoTV1zZaGpnYafS1eWMrMd3i6G6p0SoaXpLVy1Rzx8teDXX1PpzdsL5U5PIE
         AobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889201; x=1775494001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QSdVMxdN9m3u1teXqd0BR51kR0qUNsC9d7n260thy48=;
        b=GzghrPb+Gs/JY/lMiDZtUkzsJ81FM8OsACa6sSIzYpD0NErGx26hbZaFCar/XHCKF7
         y79NN4/JRITaVheTkSbdjl6G3wKP9ul0BCRxWaPs8exGfpvytTAUGH+bAVUC9bZr1wJf
         nLkp99ukEe8+kpMMVbeMouWkBlYNp6nXynT2d8cC9SmrSm6y/cu+YarlUzvwDQ+o20Rk
         +mJUHadesdIZDn4JAZUOruJxvpOoHoktPbRupraDzK0HfZPG+x4t234TCLQ9d6TA5gqc
         +jGRolPKEqJaTI/XxSKy7t/hMnljRTZ42FWi0ks5M9MfPZ/L+GdStP5H7UADcQo1Xwh+
         4MFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7M+1dJvLpldyKmgK9Jq8dAWPI9VD2tTuAfP1x2KoAJAQaoF5rj8xfrpuf8I5YRV5pSZboBk24eIKI@vger.kernel.org
X-Gm-Message-State: AOJu0YzIp1HqKq68PzyuKnxH18hxxcq3Gl1Bw4jNr/fyyGFhdKGdz9E3
	FErmpI3DH5OcZjAqPrv4Qi/KvMj7OQ3miGsDWTQdRd0uL+9x6YKQ15t4
X-Gm-Gg: ATEYQzzXOu+pEZPrdEoWRh8NWtakbiwLVWhIQ8cFjvSdDwWljqiOtXaAa6mmIW9fS61
	XwBkW5+NJP4e7fNgvHIOvdvVHdZDMmQhdLhQA8oYoFT/4D+6lfHeMnzB3VX4FvTVxJmj+mF7apf
	q0Mgc5eediXIQXttKDdpxxWmj5Tct6oROtbqRtH2lh2KFJAyfy/cm7E/xw275UoU4cIl+kwUURj
	YljOMIovJb4ZW9pLmxgj1z8s8IRpyJwyLgL800edsVlE+wZ37Xv12Pmm0ac2NWtaRT6/gHS5xwP
	crxdrBUIQfcjcJtZHdF1n3Idj001X/zAqZaD4lXArakCeFi0NlFCYHWPfQZZd+sOL76QV5xm7wl
	Y0walBHMnJ2alRTiz2LXNx3INwND57imrT4rt7nZjFElIrK1XAUDIGtAvlnssRngXuYxG1sFPNC
	7BWHIZUu3cUwf3Suf4rzeA13U=
X-Received: by 2002:ad4:5ece:0:b0:8a0:2b9b:af0e with SMTP id 6a1803df08f44-8a02b9bb731mr93909706d6.12.1774889201622;
        Mon, 30 Mar 2026 09:46:41 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecc0953aesm66087016d6.18.2026.03.30.09.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:46:41 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add lpi pinctrl
Date: Mon, 30 Mar 2026 12:47:06 -0400
Message-ID: <20260330164707.87441-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330164707.87441-1-mailingradian@gmail.com>
References: <20260330164707.87441-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34441-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,17d78800:email]
X-Rspamd-Queue-Id: 1E4D235F031
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Snapdragon 670 has a separate TLMM for audio pins. Add the device
node for it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 73 ++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c5f7655421a3..85a34e2f0907 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -2346,6 +2346,79 @@ lmh_cluster0: lmh@17d78800 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 		};
+
+		lpi_tlmm: pinctrl@62b40000 {
+			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
+			reg = <0 0x62b40000 0 0x20000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpi_tlmm 0 0 32>;
+
+			cdc_pdm_default: cdc-pdm-default-state {
+				clk-pins {
+					pins = "gpio18";
+					function = "slimbus_clk";
+					drive-strength = <4>;
+					output-low;
+				};
+
+				sync-pins {
+					pins = "gpio19";
+					function = "pdm_sync";
+					drive-strength = <4>;
+					output-low;
+				};
+
+				tx-pins {
+					pins = "gpio20";
+					function = "pdm_tx";
+					drive-strength = <8>;
+				};
+
+				rx-pins {
+					pins = "gpio21", "gpio23", "gpio25";
+					function = "pdm_rx";
+					drive-strength = <4>;
+					output-low;
+				};
+			};
+
+			cdc_comp_default: cdc-comp-default-state {
+				pins = "gpio22", "gpio24";
+				function = "comp_rx";
+				drive-strength = <4>;
+			};
+
+			cdc_dmic_default: cdc-dmic-default-state {
+				clk1-pins {
+					pins = "gpio26";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				clk2-pins {
+					pins = "gpio28";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data1-pins {
+					pins = "gpio27";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+
+				data2-pins {
+					pins = "gpio29";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+		};
 	};
 
 	thermal-zones {
-- 
2.53.0


