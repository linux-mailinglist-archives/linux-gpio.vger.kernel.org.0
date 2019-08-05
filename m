Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4BC82193
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 18:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728838AbfHEQV7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 12:21:59 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43057 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbfHEQV7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 12:21:59 -0400
Received: by mail-wr1-f68.google.com with SMTP id p13so10452468wru.10;
        Mon, 05 Aug 2019 09:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jal0TcotIi9KxsqXfi98IU+PYGjY1Ea3c2mtMMhhCOg=;
        b=ElRaPKDXDFa36Cx0EcT3JOKQ6v/xrivxKJoiRY0OIqQfBBFXuhOupnVRZN+9tjWAvU
         pPvEaPchxbV9nuROEAFFoMJv/zLYzTmYIup7xXWAuHppDpmQntPlMZprQQ6nJEEAj/z/
         IxNbj4E3IYyYx5ghpK77lFCGHWQg0P3LHH2y26EPwwGDg+rzN+nU27m/+d062+/iUA4W
         tF/Mx78LNiq7YdmAQJdWgoiW6LXY3cDlMVANOY6/9yLt6uh6iNUYub9q4jhDrX+5C7eH
         O++wEut9W8HQMEe9qIrka7fO3yYELV1n8kVmuURRcx3QJJpdj4aVjV2OrvOY1wzw3gVf
         EPfw==
X-Gm-Message-State: APjAAAWIrkw/vQlyG+o+dX5e1x/JpDsr+Ue3wugzbKZhZ6xbPhUoQoZW
        jlHK8LDppgCwF4E7Ajs3tik3HZVz
X-Google-Smtp-Source: APXvYqzqjlVLiKS5Ec3RFHkLS+GK0gh7fzmAOkFLgVA3+iIqRJre8uMWYuogV4JcxYwj/gUHU8fNrQ==
X-Received: by 2002:a5d:4f01:: with SMTP id c1mr81969945wru.43.1565022117327;
        Mon, 05 Aug 2019 09:21:57 -0700 (PDT)
Received: from kozik-lap ([194.230.155.124])
        by smtp.googlemail.com with ESMTPSA id f192sm86229595wmg.30.2019.08.05.09.21.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 09:21:56 -0700 (PDT)
Date:   Mon, 5 Aug 2019 18:21:54 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, kgene@kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] pinctrl: samsung: exynos: Add of_node_put() before return
Message-ID: <20190805162154.GA24769@kozik-lap>
References: <20190804160200.5139-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190804160200.5139-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 04, 2019 at 09:32:00PM +0530, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c | 4 +++-

Thanks, applied.

Best regards,
Krzysztof

