Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE50A149D0E
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jan 2020 22:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgAZVcG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jan 2020 16:32:06 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:54930 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726294AbgAZVcF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 26 Jan 2020 16:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=1V/T5meEi3lp3z9WtoLHDUqZu/jNnEZKliaVuzu3WMM=; b=oo8PF+bcZDKwZUU4Gc3isibiH3
        gruAkIn/CqkWJ3iGuW1cJfza2HSZcio2fNurZ2ggH/Y44++Cs7IJI9yH2UIsCBoQuC0jBCbXcR05H
        k3xmztiD0K/w3+Q1leuVi2b3zWJpICSkQX2y2et9vuDfoTeuwPZNM7j7EL1NerCYrf5E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1ivpVd-00032o-7n; Sun, 26 Jan 2020 22:31:57 +0100
Date:   Sun, 26 Jan 2020 22:31:57 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Paul Thomas <pthomas8589@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] GPIO, Fix bug where the wrong GPIO register is written to
Message-ID: <20200126213157.GA9495@lunn.ch>
References: <20200125221410.8022-1-pthomas8589@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200125221410.8022-1-pthomas8589@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 25, 2020 at 05:14:10PM -0500, Paul Thomas wrote:
> Care is taken with "index", however with the current version
> the actual xgpio_writereg is using index for data but
> xgpio_regoffset(chip, i) for the offset. And since i is already
> incremented it is incorrect. This patch fixes it so that index
> is used for the offset too.
> 
> Signed-off-by: Paul Thomas <pthomas8589@gmail.com>

Hi Paul

Please put Xilinx into the subject line. I had to actually look at the
patch to decide it was not relevant to me.

      Andrew
