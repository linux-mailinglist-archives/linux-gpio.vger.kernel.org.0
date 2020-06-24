Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E6B2069EE
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 04:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387692AbgFXCHl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 22:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730898AbgFXCHk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 22:07:40 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B91C061573;
        Tue, 23 Jun 2020 19:07:39 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id h10so580378pgq.10;
        Tue, 23 Jun 2020 19:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NweuR852F/MkwNU1J1icoSJt72FTFNVF3baoyChYHNE=;
        b=aQHlyuSVkmINthgnO8IlvQfQNiHl3Fh3Wk+SBaxME0DNd5EZwcEvTT3e7xaX1Qccaz
         QwATpAkbCIB6NVJ//9xb/S+KdJP5krKRAN7Ewrsa1hBg7s/TMJQNQcyN157dvw165D0T
         RCDTFl322csA0Fn9+G1N6LFFuE0TJKTspv6STQwEvCCeVxM4sgbB2S0JzcRk+6l5m19N
         8HrnkC1ZmwwDhraCw9a0wQRm31m4gIJqesN1HwOsvrmJyaxyvCSBxK+tkr6TjrlEmXUa
         KN7JbWfOpE/+MFUdSJ/di6832FlQpX+dbTT3ivs+ecENirdYk7cH/7XRhrq67DaucM5Q
         lIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NweuR852F/MkwNU1J1icoSJt72FTFNVF3baoyChYHNE=;
        b=mBjK2vjkbEPwF5xDt2FxgcqYmb3EyKAGMC/j3TLC6eb+YSepfSI7hB/hQdK8DcLsVK
         IT7Dx/x0iW33MRem2n0EsZNjbfHPeaWBIcAGpOW0rdFkFHjVwdZEtzBPSJsEGRTu2XZF
         1RVO5039akZ/FG3V/Z48WwID3166azvh1t6eW7u7kzaE5HCWeWoMj9CeCjrHqT7TWg54
         8q2n/tWF99G8GhD0anaUZm5Fo4WCt6q6oXYLNpJijAmW0JzaI5H4xq5I18KYYqzOPj4p
         NUOoyyVVcRSvDGspLlQlgDc+l3WzDILgB+kdr4eZWt5vBW2tIdImMmzaX7p+z4mLJl0U
         IfHA==
X-Gm-Message-State: AOAM531+5nQJHZyHctAzkBJ/hk3O/j4I2RnDWMXvWrCzY1YP+ll+y5kp
        qEJJwMPV7mMXZPKzOxUF7SA=
X-Google-Smtp-Source: ABdhPJwN0Sr3ZDJbmPOu+dSoX3SV259OdHPy6OWnXG5tg87Z5TKKn7UfG3SAOcVrg/q3BJyLEtERXQ==
X-Received: by 2002:a63:df01:: with SMTP id u1mr17901576pgg.401.1592964458724;
        Tue, 23 Jun 2020 19:07:38 -0700 (PDT)
Received: from sol (220-235-97-240.dyn.iinet.net.au. [220.235.97.240])
        by smtp.gmail.com with ESMTPSA id n19sm17615649pfu.194.2020.06.23.19.07.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 19:07:37 -0700 (PDT)
Date:   Wed, 24 Jun 2020 10:07:31 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Subject: Re: [PATCH 16/22] gpiolib: cdev: add V2 uAPI implementation to
 parity with V1 (fwd)
Message-ID: <20200624020731.GA9728@sol>
References: <alpine.DEB.2.22.394.2006231910320.2367@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2006231910320.2367@hadrien>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 23, 2020 at 07:11:49PM +0200, Julia Lawall wrote:
> It looks like the put_device (line 891) should be one line earlier.
> 

Yikes - thanks for that.
I'll be sure to coccinelle my code before submitting from now on.

Cheers,
Kent.

