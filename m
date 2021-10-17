Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C52430733
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 10:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245061AbhJQIbQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Oct 2021 04:31:16 -0400
Received: from gloria.sntech.de ([185.11.138.130]:50148 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245032AbhJQIbP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 17 Oct 2021 04:31:15 -0400
Received: from p508fd4f7.dip0.t-ipconnect.de ([80.143.212.247] helo=phil.fritz.box)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mc1XR-0002AV-VW; Sun, 17 Oct 2021 10:29:02 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, linus.walleij@linaro.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 1/3] dt-bindings: pinctrl: convert rockchip, pinctrl.txt to YAML
Date:   Sun, 17 Oct 2021 10:28:59 +0200
Message-Id: <163445933306.455569.8867235552630241420.b4-ty@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211007144019.7461-1-jbx6244@gmail.com>
References: <20211007144019.7461-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 7 Oct 2021 16:40:17 +0200, Johan Jonker wrote:
> Convert rockchip,pinctrl.txt to YAML

Applied, thanks!

[2/3] ARM: dts: rockchip: change gpio nodenames
      commit: d7077ac508e6dbeb737758dd2ef6637141ca72f8
[3/3] arm64: dts: rockchip: change gpio nodenames
      commit: ec3028e7c83ed03f9cd10c0373d955b489ca5ed6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
