Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEB6562CC6
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 09:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235222AbiGAHfz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 03:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235185AbiGAHfx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 03:35:53 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94CEE6D559
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 00:35:51 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id bi22-20020a05600c3d9600b003a04de22ab6so1037159wmb.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 00:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9hYBXBZKXmmUGaFdb6SuCfbxwhU6X3Dq6jMueRsGhJU=;
        b=SJ9YxmFNKg1Lqc7z5zv9LZYEzlBIfAiykJ0BG0dhD9UCkBmIErU+dRW+S6DJ/1IsWW
         kt12NVjo14J1sZ+7eJ3FAor6w29QZTCZFpHLfz2hI15QtwapGIcGxmiV0jTRAytru/kv
         5Kl3da6FrgykEhQSqZgfY59fjTplkidAIOihnSBOvCU4/gvFo9xBONBH+wnV3HNwfiJP
         Kzxo21s4G+wHZxmEK4Q9VnqWk6CBqoFrFiovxZp1V4lsA0Rrbpu1GC68MBvWmcocpKL5
         Snt29CDAa5E6Jyg4KXAlnBCIARdZqrBNKGn6rjukKO+aQQ0IDFVCZS4om0ARLNYuRzPU
         lqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9hYBXBZKXmmUGaFdb6SuCfbxwhU6X3Dq6jMueRsGhJU=;
        b=vVl8D6619SR9qVg5QdQkDIaGYxFvqzcRsTjYAsTJLxrPrQ29swwpC24/q73s3xWrE/
         /FgePiWzfMwDsikRjqMy8tpZDxDAxmeDKj1oKy8kvWj4hR3MXToxaB945+5/kbw02Z3e
         ouCOqmgh9iQGKlr/laQuxE3/q4ZvtDk1cIE6PEGsoTn5BwQlf8vt7NpBjvQYnu//2hTU
         UhAZ03Fzf1YKSZdFT/AxqyITzS0CKirUgSLSIbQztQIkphgyyUJPzbC68NFrDfgjBlhR
         ZFawn6BevTrfxfCP5/ZLOT1CBx/2Xcl9lqSQBrArMzshzte720pBe0pCTCXyfzs2QLKn
         2EDA==
X-Gm-Message-State: AJIora9cGk+7pElZoYYd4TcIZYflTP77i5Uk8RGdwbBAj1dctzPqOr7X
        qhiJKAwXA4H/NGrR1Fh5NQ8dBw==
X-Google-Smtp-Source: AGRyM1ug790AHM/HNC91OhZDPg3Y37LVnczLuJtQjzCb66sHR2Tt66T3JoFCH8BhqFqSEA6NG+i4LQ==
X-Received: by 2002:a05:600c:4fd1:b0:3a0:5416:2fd0 with SMTP id o17-20020a05600c4fd100b003a054162fd0mr16729105wmq.197.1656660950074;
        Fri, 01 Jul 2022 00:35:50 -0700 (PDT)
Received: from blmsp ([2001:4090:a247:8068:1e6a:750b:72a7:72d5])
        by smtp.gmail.com with ESMTPSA id j6-20020adff546000000b0021b862ad439sm25816160wrp.9.2022.07.01.00.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 00:35:49 -0700 (PDT)
Date:   Fri, 1 Jul 2022 09:35:48 +0200
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Fabien Parent <fparent@baylibre.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: mediatek: common: add quirk for broken
 set/clr modes
Message-ID: <20220701073548.4za7fl2jodhpdaqe@blmsp>
References: <20220530123425.689459-1-fparent@baylibre.com>
 <CACRpkdYZJUWb4TBJiZVK4SNeA2Njn6341FuDjdYsn-0_yCeRKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACRpkdYZJUWb4TBJiZVK4SNeA2Njn6341FuDjdYsn-0_yCeRKg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Wed, Jun 15, 2022 at 03:23:57PM +0200, Linus Walleij wrote:
> On Mon, May 30, 2022 at 2:35 PM Fabien Parent <fparent@baylibre.com> wrote:
> 
> > On MT8365, the SET/CLR of the mode is broken and some pin modes won't
> > be set correctly. Add a quirk for such SoCs, so that instead of using
> > the SET/CLR register use the main R/W register
> > to read/update/write the modes.
> >
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> 
> What is the state of this patch set? I see changes are requested by
> Angelo, are they being addressed?

I will probably pick up these patches and work on the comments, but I am
currently a bit busy on another project as well so it takes some time,
sorry.

Best,
Markus
