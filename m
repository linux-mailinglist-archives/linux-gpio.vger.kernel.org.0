Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8148F55A09
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 23:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbfFYVft (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 17:35:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:36616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfFYVft (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Jun 2019 17:35:49 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 785BF2085A;
        Tue, 25 Jun 2019 21:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561498548;
        bh=XKjXGt7wBC/YazY7KhXqUWQeoN5TSITXr1HNZAKEqJ8=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=MhD7Oj77rhAVh4rKM8EbBRm++EskHFsfmlsSM/P9qlhtezwO43hkKOH3Tq/Vfh1gw
         T5ng2UlIuncLTuLaLuhLO374aHdGKnM0sMwKW7LiyXPWlOIZZyaqQhsdXobWykEgrk
         prG9p444fFRYfPs47oQnDSDH5iVNentt9Am5fTKw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190617215458.32688-5-chris.packham@alliedtelesis.co.nz>
References: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz> <20190617215458.32688-5-chris.packham@alliedtelesis.co.nz>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>, andrew@lunn.ch,
        gregory.clement@bootlin.com, jason@lakedaemon.net,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        sebastian.hesselbarth@gmail.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 4/4] clk: kirkwood: Add support for MV98DX1135
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 14:35:47 -0700
Message-Id: <20190625213548.785BF2085A@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Chris Packham (2019-06-17 14:54:58)
> The 98DX1135 is a switch chip with an integrated CPU. This is similar to
> the 98DX4122 except that the core clock speed is fixed to 166Mhz.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---

Applied to clk-next

