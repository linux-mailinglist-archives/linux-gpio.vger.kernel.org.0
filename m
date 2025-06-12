Return-Path: <linux-gpio+bounces-21420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E1FAD67EF
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 08:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF3857AA16E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 06:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13001F1538;
	Thu, 12 Jun 2025 06:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xCfHSAI0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0121E25F2
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 06:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749709442; cv=none; b=agngT20DQA6scxoQqlV743domMnhm0YqL5Z30OvaEWa7vQqJSjWmpsf6ucBr1qaH6l8iqKNBwZk4t33G6fqj4WyUIx+jDfy9bUYFTw9W+gC3/i/U4MWAdiB4Zx2YnPFgYlhiehjvM7IHdzuhFYR0IaMUb9KVM1kHyu8tlGzjWR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749709442; c=relaxed/simple;
	bh=jljVNt6BPZD/UUQ9H+MR7vP5z5VUVx+PYWtSAHZEcXM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DbF07qqd3LQrxayFl04XJOFRiClvHxlozzT2LDTFOcP7m6GG48ZB4E74M+2RmR4OPStdslLe/wzUICW7EoYQbq0XyXEFXnYhuizq8KuaJslFmvpi1iirsqe2iWglN8qwEpP724OO+70cobx6gciPdZL6LHUmiVUAz/SWFL98lrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xCfHSAI0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-552206ac67aso485199e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 23:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749709437; x=1750314237; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FX+vwXZpIRgv9MzwOtx1+r1I221i/Q8CEVWsZrvD4vo=;
        b=xCfHSAI0sVYIf8jqfH0STxCFGkhRgeoz76J7jalyLG4GHqQoMS1jTExgP01Wvn09zv
         zShZ0WoXI3qZLDXuvARTEA5gHdGnKdk4hh8vjlsynI7QvboWJzBghBdg/3Skm7Yrj5pq
         D2kezgxdoubkdrxZ59eP6OKCEw8eOrT2R4KTDowK2Lc0xANIryxjDDL82Amyoj/LiouC
         GekBJaa9IW4/+nJlzxj2Pc4VuM1wM60ThnPgo3xn7ME4sRDAecTrdAg8OOjRvf/TJ+VL
         dE/qK6wvAMq+YjN6SeR7Q9dgTMraAp4LWjJiULaLHGhN95djD47o2ESd/56PuSgihuoT
         k6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749709437; x=1750314237;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FX+vwXZpIRgv9MzwOtx1+r1I221i/Q8CEVWsZrvD4vo=;
        b=MILAlpz9hkWRX8F4qh3BDR0wwHU2Nqm/adRQoWC6KfrrG2u2/s9msRv1h8xK55pyQp
         Zx43H5vspr5A7pvDLtSGMVKDUIni+S7ynRgFOipYzVNVDnjx8L8hxF5br4zilkb228JX
         MS0jEpcMVnYwe1bUy29ElcfYzFUc4pCqUUMKssbsH6GbdiwjV3P2UxT2WLzyyseoxW9o
         9f+rE/Hu8PHNIXtmpvhjRCifEDVIM8+Ga1DH2a9amT08waAjXmx/5YRoA50DeM6PxhXo
         oTlEU3XccrU3xFBfPRNpytNLMBQ6pakzQ0zlE70AxFLbTq20IeGycoU7BzJZkhddBJvr
         B5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGzxIh7Q/Rs733qieNN52mgCl8jxh/X+M4KAPLp/x+3vEj1lZlwoZ1ENnw9aGSLkW48BIIYA37Zgyh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxphz5BBl8DVAiEsicsEXqj+3c7Gj9h5CYIuimfSSyNsG5Vx5Tm
	s9Y4tQ6UmIzBNc665Kg9hAtvkPpZR3Di5WPmCDPzWlkFql+pLtsX7hJx1Q356PQMGHWV3BaL4ZA
	6KhzcqxA2SkswCv92DZLdsGCBW+btEychuoqBkoFzTVltZ57CoJQ2vEo5Ag==
X-Gm-Gg: ASbGncvL+Q8pcjs1mr3Jkt/qvtiO7Dk/z+GnfoxNlfrC9PLOFFteDmHB3+PajRjTB5H
	IuYRd9plEu6KrHaIVohcGNARiXxg5a4PB1COtFxzwdzo77irSbDnz837jC6IZS4xRDgFOy4AiL4
	GxJdqVEaxjbBMf9oJpN/VirID2dFeQJFwTnZl8Oad2ezw=
X-Google-Smtp-Source: AGHT+IHiqtEaFEnU53BOIjWvNP/y8XLoZUmy6d6q8hVj7pnj1jo/Lb3aYWmh9pEA+2n/ULjXKv8QqT7kQYcfnPLgUx0=
X-Received: by 2002:a05:6512:108c:b0:553:398f:7730 with SMTP id
 2adb3069b0e04-553a53dc4afmr645333e87.0.1749709437205; Wed, 11 Jun 2025
 23:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 Jun 2025 08:23:46 +0200
X-Gm-Features: AX0GCFvnh3xByupXFFA9XIoamiMqBdjgp746Q9J1lzhrhz83kl42XAIxlwoR7Wk
Message-ID: <CACRpkdYC5Ut3L9Og5-c=e1DmqzQD-6BSDS-cMyhcmQq2m+LsYQ@mail.gmail.com>
Subject: Pin control fixes for v6.16
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

here are some early fixes for v6.16, nothing special just some
merge window noise in various drivers.

Details in the signed tag. The first Qualcomm patch was something
that was based on fixes submitted late for v6.15 so it wasn't in
the v6.16-rc1 pull request as that was based on v6.15-rc1.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.16-2

for you to fetch changes up to 5558f27a58459a4038ebb23bcb5bd40c1e345c57:

  pinctrl: sunxi: dt: Consider pin base when calculating bank number
from pin (2025-06-10 14:35:40 +0200)

----------------------------------------------------------------
Pin control fixes for v6.16:

- Add some missing pins on the Qualcomm QCM2290, along with a
  managed resources patch that make it clean and nice.

- Drop an unused function in the ST Micro driver.

- Drop bouncing MAINTAINER entry.

- Drop of_match_ptr() macro to rid compile warnings in the TB10x
  driver.

- Fix up calculation of pin numbers from base in the Sunxi driver.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      pinctrl: sunxi: dt: Consider pin base when calculating bank
number from pin

Dmitry Baryshkov (1):
      pinctrl: qcom: switch to devm_gpiochip_add_data()

Krzysztof Kozlowski (3):
      pinctrl: st: Drop unused st_gpio_bank() function
      pinctrl: MAINTAINERS: Drop bouncing Jianlong Huang
      pinctrl: tb10x: Drop of_match_ptr for ID table

Wojciech Slenska (1):
      pinctrl: qcom: pinctrl-qcm2290: Add missing pins

 .../bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml         |  2 +-
 .../bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml         |  2 +-
 MAINTAINERS                                                   |  1 -
 drivers/pinctrl/pinctrl-st.c                                  |  5 -----
 drivers/pinctrl/pinctrl-tb10x.c                               |  2 +-
 drivers/pinctrl/qcom/pinctrl-apq8064.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-apq8084.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq4019.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5018.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5332.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5424.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq6018.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq8064.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq8074.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq9574.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-mdm9607.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-mdm9615.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-msm.c                            | 11 +----------
 drivers/pinctrl/qcom/pinctrl-msm.h                            |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8226.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8660.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8909.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8916.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8917.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8953.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8960.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8976.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8994.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8996.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8998.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8x74.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-qcm2290.c                        | 10 +++++++++-
 drivers/pinctrl/qcom/pinctrl-qcs404.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs615.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs8300.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-qdu1000.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-sa8775p.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-sar2130p.c                       |  1 -
 drivers/pinctrl/qcom/pinctrl-sc7180.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sc7280.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sc8180x.c                        |  1 -
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c                       |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm660.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm670.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm845.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx55.c                          |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx65.c                          |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx75.c                          |  1 -
 drivers/pinctrl/qcom/pinctrl-sm4450.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6115.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6125.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6350.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6375.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sm7150.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8150.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8250.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8350.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8450.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8550.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8650.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8750.c                         |  1 -
 drivers/pinctrl/qcom/pinctrl-x1e80100.c                       |  1 -
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                      |  8 ++++----
 64 files changed, 17 insertions(+), 80 deletions(-)

