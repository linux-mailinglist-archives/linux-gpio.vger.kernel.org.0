Return-Path: <linux-gpio+bounces-6398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D85AD8C6641
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 14:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F7F31F22BD6
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 12:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BFD7868B;
	Wed, 15 May 2024 12:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkoBitK6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B637602B;
	Wed, 15 May 2024 12:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715775472; cv=none; b=kCuxxhkat8vPh3MaTNaJneEE211wRvoqeXoBndCDfLQIl8K6/M/DNHJVml+MhgbIAhNA57IMuaZl7Jd2SMGYND4BeskEfYr+BKfJldeqdp0d9gOw2m4XzlwebzgVzAwzXe9tDTT2WaXW/fUAzQK5hy2KnGO7JwsMHmGi3V6pXnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715775472; c=relaxed/simple;
	bh=Z6GobS0ZiQ+MC5nje93jjgX2wbI3hLD++sRBwJhlE5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=maf/VpfZt0Ay90EY2VJ/LReXIJ+99wQQxgufccEilU+9xSzyAshx12vk8GQ8ALMkPZP7HG5tsUqIvDxYoBlwFUKta0xEOO1i8dbWJ40EBtrLypwlkfwWY89B0vTOqhlA62LMChiqNgjgM/CY7RIH0xINoI/HKS9X3utu2TccLvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkoBitK6; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e09138a2b1so97237511fa.3;
        Wed, 15 May 2024 05:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715775468; x=1716380268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3KqD+Z3JR2ObvSBJ0FdCX7GwhteJE/GLd+R3VulPlg=;
        b=LkoBitK6n6wI4ZoTfZtjXHVFn/qkKBteuQKirjvbhIfgQMe/pozexfdvXHxjSM8BH1
         R9/MXu+ilnKm2hN9xs+NNqF4kzQwRetUhPFLlkVgZlJhsWiMeIj58IZTPcM+/VkATu44
         dvzFH+YPMo2nAVz3TS9sTgRh+2YmWFEHD6no9XBSQTlvvz70JWpDFAN/2ubVWhy2i8Nn
         CpIL9t2X4mU1dkkqL2Q8D2tim2NSfPgLDbMbGMOJ2rJLmtE3lCtwjygAUd+DPDHYeVRN
         3jjSzel2+8o98HfYtunPFCzXPs7+LHNTnN1Dx9+eFguSuPn/QzofRNewSNns2gCri+4G
         k+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715775468; x=1716380268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3KqD+Z3JR2ObvSBJ0FdCX7GwhteJE/GLd+R3VulPlg=;
        b=kdFRWYx3M3Nq5Dlx/Ur5XSjzcCiaJNFDwkNaIWRR4BP8Sjv4ZzlzHxYqD1i7+I48K/
         z2oj2AJiPHZH6dx4lzOQqgw0itGorAwh0kTI3B1QBXBaYRrfu4OFlhh7zmwUrrsRaJtV
         4dD4RR5+WzqV1eyMenYp7BzoWxgMvaV3NbcLGgeAhLqMUZumMIVuW2O5yfZ1fUduSqAr
         a7/n0XF9G9SusROaKlTu7MdENnKnqeDzewiYjgogdxjbKYq7fC9R/emC65fitvbXat84
         Qlmnl7KVehRVQ858Zwx3Y02ukzbw9aF/qqAFOoFSjEGHQ6guPGNSohGXUZ54mztA4s1F
         Yr1g==
X-Forwarded-Encrypted: i=1; AJvYcCXAZfQazBjmj+XvrSlIy4shj/t7J54I+j4GTTgSgVLaYYuvdU2qZWRaB7g7naq/yFokAmng72QJ+07HJldFjuoqr6aYMZWji8c2IOJNU7hnqVMNtllaPoaUnRFaIooEAsZ9hTp84ybT4AxSl+uTQVZicHsj9u4SdEIAtvoSby6PhAXhOqQ=
X-Gm-Message-State: AOJu0YyDJNlcjjc6YG+OfeBzOZe6PqoGqWfmDjFTViUH74qVohJu17BV
	E8Jsl1Qomm87YbHAgpR9yRi6uQbirkRRFrJkbuwWcEt2QtPGvQar
X-Google-Smtp-Source: AGHT+IEXRk96wg3lRsQcAuggItL4GF0NS8jPU3fr4ziy9hJdP3xCvb09LuumKpau5k+swE2FzP38nQ==
X-Received: by 2002:a05:6512:e94:b0:521:cee5:db36 with SMTP id 2adb3069b0e04-52210074834mr12700228e87.48.1715775468388;
        Wed, 15 May 2024 05:17:48 -0700 (PDT)
Received: from yoga-710.tas.nnz-ipc.net ([178.218.200.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad684sm2515614e87.3.2024.05.15.05.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 05:17:48 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH 2/3] dt-bindings: pinctrl: rockchip: add rk3308b
Date: Wed, 15 May 2024 17:16:33 +0500
Message-ID: <20240515121634.23945-3-dmt.yashin@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240515121634.23945-1-dmt.yashin@gmail.com>
References: <20240515121634.23945-1-dmt.yashin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for rk3308b pin controller.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 20e806dce1ec..1b38b496cc8b 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -41,6 +41,7 @@ properties:
       - rockchip,rk3228-pinctrl
       - rockchip,rk3288-pinctrl
       - rockchip,rk3308-pinctrl
+      - rockchip,rk3308b-pinctrl
       - rockchip,rk3328-pinctrl
       - rockchip,rk3368-pinctrl
       - rockchip,rk3399-pinctrl
-- 
2.39.2


