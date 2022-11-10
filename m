Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A06623F14
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 10:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiKJJyF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 04:54:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiKJJyE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 04:54:04 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B760D26AC8
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 01:54:03 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id ud5so3623634ejc.4
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 01:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xevay+FatCNgIgOdMn7/OhB2kL2/LvApT07x7t4mx6E=;
        b=C6t5Jyv97v2b3isQhO/pztgaUXISCEyKpDujB5ciUosZXi5q335QRhBRUCQnS8iqWu
         x+n12cSTpCU1/kOGk0NxDvupQ+dktZoVrFFe3SaQpVzY90CXIMSAyYXVZuEvesk36jTn
         qRNTnPjCb0RER1nSteM8XWQA9GfTjO5ahl4osvd2pmmORB0F6GCqPkyjUA+/ISUi/bFj
         wo/9iEoImctmXGfeIZH9vbmGTxhHDt5YPSCC7uSURY2WYUZ26ITOT5RX8yN7BI2iVzq5
         XnejdJgPTJ2xW0NuIiYqKwVvz1oMUoL+MzzNW2tEy4ijj2P9D7AvxHFQcMlpVvS+XONC
         MnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xevay+FatCNgIgOdMn7/OhB2kL2/LvApT07x7t4mx6E=;
        b=mlX5VECYaa2HCIGF2v7fsULmf4smV4beWhuDfRqTj0+E6GpXEfJL05hynZ1W+Dtndj
         7/8UhUSz1i15lVtOMiHRrjkm3OdFIX8j5YsbkKuN4r0vlPkE9oBpPiZ/x3lyY+OQYRdT
         K/W4Q3LQFazsKgE5qKmJ0SUWcLqAoq8eLEZFwpMjSTPX9ebuUKkMLRslWXyBxk2lh/fF
         dvJyAarPbIGdSQsa5bkkrgs1/cpKcBtNwrrBVPEyOEnFQDYrHzfolCR38vC/wAvuNs7P
         XxEm9Bbz8+2JYfZ9cpegVI8SJhFRJCJOWXtlxh2v8TbSQcbAUwzd0TZvol28I0VGTiXU
         UpTg==
X-Gm-Message-State: ANoB5pkZU3jyCasOPXid9grpOdM7N/PkJPptMPrMbLtYVs6xNYgaxmSk
        O83Y9JTCoyOWP5JYRq6tYue1JIsq/cuiPOnAMNDRVw==
X-Google-Smtp-Source: AA0mqf4F2g8JJZa1qi8tyAuP2lYn+3e3X+vhInrxNn/UiLA1L0u0h/sPC5hycIQFFUMiE2PXsv/PnYirMi06Q4Ks9Ac=
X-Received: by 2002:a17:906:6acc:b0:7ae:658c:ee45 with SMTP id
 q12-20020a1709066acc00b007ae658cee45mr17374736ejs.190.1668074042323; Thu, 10
 Nov 2022 01:54:02 -0800 (PST)
MIME-Version: 1.0
References: <20221109152356.39868-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221109152356.39868-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Nov 2022 10:53:49 +0100
Message-ID: <CACRpkdb+Sf8un0QkvxVGm_fH0fnC5U60HtUDdXvyyd4o6c=iEg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: Put space between type and data in
 compound literal
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 9, 2022 at 4:23 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It's slightly better to read when compound literal data and type
> are separated by a space.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
