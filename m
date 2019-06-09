Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBAE3AC1F
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Jun 2019 23:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729538AbfFIVwV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Jun 2019 17:52:21 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:46583 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729529AbfFIVwV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Jun 2019 17:52:21 -0400
Received: by mail-lj1-f176.google.com with SMTP id v24so1798902ljg.13
        for <linux-gpio@vger.kernel.org>; Sun, 09 Jun 2019 14:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3u47NK04VLWnks2ECFn41iwvdVn3zhAxLH2OdU56Dmw=;
        b=Cl0rVA3z38e6L8+wW94OpWj72TSurDFbVXa3pn24DZWJJzrOrvC+fdcaUtFQndqIgP
         txxwbLiEo1JBtH/op3umTaxckv2djd/WaR5I5qa+EGNTpKe0HtK0Tq8lpu4RgQ+aidH1
         RQN+njo2AS3nHqvbBnl0jOecogbHfZyq2ZQoBr6Un7SjO9AiaCcnPinHmJPgJB5ysgy5
         i4n1mXa2crZfqK3FvymkbMZneKJ/uEnHKZlQ/hZb3BaKT89F9FiUvIiAc0qIjTvgsyHc
         GdMMVySRP+4084kUDTBoax7mRi1FuV0caKswGmr9183KWlYwKXnOIZg9Gxdz/EPAQTx5
         IU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3u47NK04VLWnks2ECFn41iwvdVn3zhAxLH2OdU56Dmw=;
        b=W3VsAMeDE5D5JDGULBVBpX8plTp/d+KsiWZME20a4AdPZKmq1bMCAbxSeZhGXzn+60
         UzsrFENHFI33attDWulQZllPT6Xj/zlq54D29qhhAY0qaDe6tnZr6KsaQyh9xC7hVSBb
         gbIXr5Ac5ZycdPH5XrnHYltivci3EiND+UqmqONJEOOCi5q/oFJhp+CMETTizmOysry0
         j0HOn0V9ZCweFdHrRp7PgRBj+zgXJXcSN57zWdSHh1q19mDq8vuZoOPOR/oryWm+2V0N
         4pp0a1+gCEjiuftiBgTtDNtZgiDstEapJ/lSD/H+DTbR18QcQo+6ss4Iz0TCM7bgDeK1
         t8IQ==
X-Gm-Message-State: APjAAAXnhJ1FBj+OL75fw1iOF0QU22t4Lmlll5TrsggVH/xCqiRL/Ijv
        DpjOsIoRYvx1mhWvEOTDtuKq7HUMKn6E1GQnlwPLJw==
X-Google-Smtp-Source: APXvYqxxvAPH8DO2c0X0YBL0L2eBq2A1RkbOzyw6mq+phUKB0rDXYXygI1YbFcBf/zVxAnxBKN7lStrxUTnG75YtXlc=
X-Received: by 2002:a2e:9753:: with SMTP id f19mr10655574ljj.113.1560117139172;
 Sun, 09 Jun 2019 14:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com> <20190609204510.GB8247@lunn.ch>
In-Reply-To: <20190609204510.GB8247@lunn.ch>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 9 Jun 2019 23:52:12 +0200
Message-ID: <CACRpkdbOnxZJZ=Lvv0mbnrCg8kPWyeRsBbOa2cUiwjcPnR=4RA@mail.gmail.com>
Subject: Re: [RFC next v1 0/5] stmmac: honor the GPIO flags for the PHY reset GPIO
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        netdev <netdev@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 9, 2019 at 10:45 PM Andrew Lunn <andrew@lunn.ch> wrote:

> Linus can probably create a stable branch with the GPIO changes, which
> David can pull into net-next, and then apply the stmmac changes on
> top.

Sure thing, just tell me what to queue and I'll create an immutable
branch for this that David can pull.

Yours,
Linus Walleij
