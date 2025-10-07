Return-Path: <linux-gpio+bounces-26851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFD1BC0017
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 04:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1E64C34CA10
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 02:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3102B21CC5B;
	Tue,  7 Oct 2025 02:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="osb74vfy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E568219E8D
	for <linux-gpio@vger.kernel.org>; Tue,  7 Oct 2025 02:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759802631; cv=none; b=G7q1kP4cqIAwH1+SxtoaxKnhj3qNyzG4lioC1dUagf5NhACGwUwItDAbUyUXcfTIls6iwbX6UdX3GV06XNJVg9VETqbT9xmNotHyxcdo22ql3elKPQkQpQFWL7QLkRTy/Z1/KFxml03rr3eOMrL1su8m2MJQdhBt4lF/z9kwQvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759802631; c=relaxed/simple;
	bh=dinlYOq4GNp8S92cG3IIG6xQe9bDgEHO1mWnzU7Enuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PpEzu5u1QxaMDx1louareOEfK9bcICFocKKhqRrM/zDTb7LkrXsBVccNCMlb/P+Y4uEpnjMMVaDzCVOMMxe0U3TAOPXngXNfzYMdOF540zeGE8jPnQRj/KDG/8HRYlQOMHPo0OSEswQ/wBXyoTcDJ0xVvKzpgQZVy1Dr5LuqcUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=osb74vfy; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5797c8612b4so7483854e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 19:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759802626; x=1760407426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dh2P+1S/rGMae00So34IFmR5edBimGYszi1sGivuL68=;
        b=osb74vfyTFtNpbUrt6ea8gZn4J+VeuJAo7XMmuAdTmvgaNN/zeedIWkisYRjkRCUx1
         Vn5qPyUN8rzlUpEM8s95QHkChU9nfmHQBmTmiQGoBDiHBTlwr8DCb5QxAQ5loQ2RcROD
         NWtOwtX6wetJxP/izoKPGntwXuAFEhZdQJE4NHMXc3iTMyGPO9WgGg3znbapNGYxxLtg
         IFJ3/fIsQiypP2KpfB6xmxmjuimLQtQZez+CK54Y2/XGhNj/qjrzihTvk1IwfPamWDDn
         sGcaxUAEwaC1QUn37TJWa+8zcfWaMkfQL9pLcRAM7y9RntHmcIA9PQE8Z8tw7sXBJkOf
         eQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759802626; x=1760407426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dh2P+1S/rGMae00So34IFmR5edBimGYszi1sGivuL68=;
        b=vrTOP0aRqxx8ssaNOVWJbHnhCwSlhgJU35ul8oFJK7eeUEF1yk2vnFwkiu0dIZT5dk
         tkxiINiFpBE7SYTHAls1EjYT1blBKXIigrCaSGtqR1UYSSruSZO6ze/ITog4yexlKaVW
         YZfKkVzg8FfPlQUOnIrqUHwZqzDz+JIMDRjcpbFcz/+dRG2uI7KvYOGrOcQDhf7p9eBx
         7vuS+Ru3o5tCTw7EE4MVHN1VMsBl0OjT2SQprj62H5DJg72jNPC6iCTW9/IwBxDccGq2
         QzCF3UV61ad5qeU/q7iuqGGFZgDJwE8FDzjvq0d9lOdYCPNIzeM1BavcojRqly3IBFOq
         seOA==
X-Forwarded-Encrypted: i=1; AJvYcCXKwQdChe8jyXJFgUUo8zDdXmaNbAN+3J77D1F7n82INi9o8E/PS4U2Ay9ZaUQNziLe81LGEpiXuuh4@vger.kernel.org
X-Gm-Message-State: AOJu0YziXC3TEkFdiZ30kAski8bpT7+/R1R/Ymxjyo7MlXKS97epc2lb
	WT6JVwM4yne4+WuGJe+iYOya46T948GxF/AJIpi/Q0nxPJkE3x9Y9wNiyLfx7n/vv4I=
X-Gm-Gg: ASbGncuoh1Zxn0Dpl0jxWF8Rn0Uy2kXxLGRc4poa5pTa7i8V6os41dSSl/PDraVDlPB
	4GeVGThbJNU1uOVT0o/bngpN10I1k1oXJ1PYF+EVrHV+citLrugxIlsd+Ed22/nnmQuqHshfHyj
	N/OrXkO8lBxJ3BoqRwGg9LUvnYjsKaoY28Wx3vVgok+g7BA+utczo+qLpYDHE6/zZ3jsTSYW3ou
	tKTSNHFAMd3SpdcojJNfr2Pbgpynm5kovCLIxlsD5PwF4wpgNkG4MTn15gP7jP2bs4ZylPAU7zT
	vq3pK/z4SZPKi4p0Gqy8400nkMQ3Y8a3Vio2QXbVsLjhYMNoYiOjllYISuMuAcsICpxfp1WkcI+
	N5MjEh2ksTieEd2qmDvrLkms1pEkluXqtvGVmYxpnLEGQAXKGWwSRqlck
X-Google-Smtp-Source: AGHT+IFI9nX6DVmCAMZ3FKDjnGx6oV0QSc0nIDHxs6ctW8TRx/vmNB5maIOBRka6gVB6NnvAv1QDrg==
X-Received: by 2002:a05:651c:25c7:20b0:372:8f03:b73f with SMTP id 38308e7fff4ca-374c384e19cmr36666571fa.36.1759802626183;
        Mon, 06 Oct 2025 19:03:46 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b81e45sm5150391fa.46.2025.10.06.19.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:03:44 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 03:03:31 +0100
Subject: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.

While at this, also add description of lpi_i2s2 pins (active state)
required for audio playback via HDMI/I2S.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 7303aff33814f256a2ea09a71a640db466370eff..02eee364e618358e5ead78c2b97fde12a57ede0a 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -673,6 +674,46 @@ data-pins {
 			};
 		};
 
+		lpass_tlmm: pinctrl@a7c0000 {
+			compatible = "qcom,qcm2290-lpass-lpi-pinctrl",
+				     "qcom,sm6115-lpass-lpi-pinctrl";
+			reg = <0x0 0x0a7c0000 0x0 0x20000>,
+			      <0x0 0x0a950000 0x0 0x10000>;
+
+			clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 19>;
+
+			lpi_i2s2_active: lpi-i2s2-active-state {
+				data-pins {
+					pins = "gpio12";
+					function = "i2s2_data";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				sck-pins {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+			};
+		};
+
 		gcc: clock-controller@1400000 {
 			compatible = "qcom,gcc-qcm2290";
 			reg = <0x0 0x01400000 0x0 0x1f0000>;

-- 
2.47.3


