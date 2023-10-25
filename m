Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 880CF7D6CAF
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Oct 2023 15:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233837AbjJYNGy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Oct 2023 09:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234066AbjJYNGx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Oct 2023 09:06:53 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75192111
        for <linux-gpio@vger.kernel.org>; Wed, 25 Oct 2023 06:06:51 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-27cfb8bc7eeso4477769a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Oct 2023 06:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698239211; x=1698844011; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4xjM7HBy0JCkv44GkFFjVLz/sqj+39ckUlJrYxw2oEE=;
        b=d9urmlhbdLiqAyKMJuGurkCNyZdbPFzj43gm0Kh4sfe9E+wK5Wbv8Sn0+Jwio4/tcN
         3gmirXSPuLt66Rsp/nJ8TM23CzZtwt17mDU17YCCAlyxTAI6gIDDYvZ9eilrBitgK/bW
         kcPH2h3pAZlQWbQUJfCUCSMXHX2lljSuLz+ThOnui5t6lQ0ZCo+vyeLK9I+X0xFBo8td
         pEhonkPGN4gsWQGA/zteryXGJclDGhTfYoCT5e4HUmClnKs4PhG2Gd3bUca/cqguxLyN
         dj7nWoU1dVyEPu+pa3mv8XyQ11i0TM1F9kdWVUdTbAalRSfMZgJjWsJOw6Faj4PehYCO
         x4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698239211; x=1698844011;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xjM7HBy0JCkv44GkFFjVLz/sqj+39ckUlJrYxw2oEE=;
        b=TQWGsHTk4RRrZ5kBWdakTkcrHi0/xTp+atXrBGXBsxinz1KksBXHvMaYI9nbfhu4hu
         npLq3L1raHaGwkpAi97EQNaE9wGy1fjK45Nv6CsJDba4dB6irB19UErnkZuL40Y42+eT
         DkHYxzPw2boAEp8DIpEZm/PtexXb5wlYDmiOgKtyk2y0xsjL/4/KfkhA/SGfOduvLCJp
         9HTD5NogF6BsAtUiH8KqBvxDWebrRVVFdX1D4Qx3Aixzs/Vo5cS4fj2WH9bWpnmA/AsC
         kU6LcbP3i6pypgq4ipsOUiNGIe9tZi8NCOjWPC0tDL7WOmpTeFUGMQxerkaoUAJtNM6S
         cwFg==
X-Gm-Message-State: AOJu0YwYL76kQD59Lql1dnjYpikVRWSquS6KiJ3dlLsds02k8d4C9snr
        inDqS4ew1gbmkZnAXchE9RSC/Qpxit4=
X-Google-Smtp-Source: AGHT+IFZyCvGdZjASIl8QZnrUufv3ncDSn8KsuuffNHNDx0agnEfx7jHDW5baB3WGiA5K7m68qx8KA==
X-Received: by 2002:a17:90a:de18:b0:27d:2b81:5798 with SMTP id m24-20020a17090ade1800b0027d2b815798mr13680643pjv.48.1698239210754;
        Wed, 25 Oct 2023 06:06:50 -0700 (PDT)
Received: from rigel ([220.235.38.125])
        by smtp.gmail.com with ESMTPSA id k64-20020a17090a4cc600b0027360359b70sm11535787pjh.48.2023.10.25.06.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 06:06:50 -0700 (PDT)
Date:   Wed, 25 Oct 2023 21:06:45 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Phil Howard <phil@gadgetoid.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH v9 1/1] bindings: python: optionally include
 module in sdist
Message-ID: <ZTkS5V6kRevIZNfA@rigel>
References: <20231025082707.821368-1-phil@gadgetoid.com>
 <20231025082707.821368-2-phil@gadgetoid.com>
 <CAMRc=Mdy3o1xPG6QHjp_p9aojVdZw3NgUO_WGjAe7W59wBPVDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdy3o1xPG6QHjp_p9aojVdZw3NgUO_WGjAe7W59wBPVDA@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 25, 2023 at 02:50:57PM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 25, 2023 at 10:27 AM Phil Howard <phil@gadgetoid.com> wrote:
> >
>
> This now looks good to me. I'll leave it here until Friday and if
> there are no objections (Kent, would you mind reviewing this one?),

I've got nothing to add.

Cheers,
Kent.

