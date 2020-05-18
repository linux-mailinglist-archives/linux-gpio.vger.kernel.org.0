Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711CC1D8AD2
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 00:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728489AbgERW2V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 18:28:21 -0400
Received: from gloria.sntech.de ([185.11.138.130]:52630 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728338AbgERW2L (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 May 2020 18:28:11 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jaoEu-00005F-JV; Tue, 19 May 2020 00:28:04 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: replace RK_FUNC defines in rk3326-odroid-go2.dts
Date:   Tue, 19 May 2020 00:27:56 +0200
Message-Id: <158984064169.2259329.13349671967447925273.b4-ty@sntech.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200512203524.7317-1-jbx6244@gmail.com>
References: <20200512203524.7317-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 12 May 2020 22:35:22 +0200, Johan Jonker wrote:
> The defines RK_FUNC_1 and RK_FUNC_2 are deprecated,
> so replace them with the preferred form.
> Restyle properties in the same line.

Applied, thanks!

[1/2] arm64: dts: rockchip: replace RK_FUNC defines in rk3326-odroid-go2
      commit: 213f272b754f4e27aeab9d1265c775610e612bb7
[2/2] include: dt-bindings: rockchip: remove unused defines
      commit: d09855bdd8c4d4eb6e58b8546318ebb5859a513c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
