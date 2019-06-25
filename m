Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2341855A02
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 23:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfFYVfa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 17:35:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:36184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfFYVfa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Jun 2019 17:35:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F9202085A;
        Tue, 25 Jun 2019 21:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561498529;
        bh=4352Ubw5UpbKzczGTQR6bQCqvhXA2YXbUSsMmfZjfvI=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=lbTeYDfSQtcjPCia6U9FjeXvtlrzvUaQWlXvtFua0O0SXodaThvaHxkiRaMxg3WCW
         fWvWdS01OhTLAJnLx4WZTE4FerkVictkUVPdartyysznX2Y2jmBNULt8IYPEaPwnY4
         TgDl7MiZW+wVww6wxB1421Df5mAcDBmpv1ou0/8I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190617215458.32688-3-chris.packham@alliedtelesis.co.nz>
References: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz> <20190617215458.32688-3-chris.packham@alliedtelesis.co.nz>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>, andrew@lunn.ch,
        gregory.clement@bootlin.com, jason@lakedaemon.net,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        sebastian.hesselbarth@gmail.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: mvebu: Add compatible string for 98dx1135 core clock
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 14:35:28 -0700
Message-Id: <20190625213529.4F9202085A@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Chris Packham (2019-06-17 14:54:56)
> Add compatible string for the core clock on the 98dx1135 switch with
> integrated CPU.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---

Applied to clk-next

