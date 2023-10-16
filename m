Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 833FD7CB39D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Oct 2023 22:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbjJPUCP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Oct 2023 16:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233874AbjJPUCP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2023 16:02:15 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B954EEB
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 13:02:11 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-579de633419so60860177b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 13:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697486531; x=1698091331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQoDoAuWq/27hqVetrn03P+WXOf8CvsJiH0pcWvLvo8=;
        b=lBYZoIyhi/d7QJlgp27utNJ+kpaUIO2CquXwNhruTdJowSpgnhWse6HUNydj5m0y1f
         wSpZE6N8ekcXf9JjQN4LNHus2tueaFTuP+xAImDlZ9mLVbto1F5PnUblrJ2Up6T6aC7C
         Ft6NSW2nY6TSWwqCW9s0Y7adXtPrZNdbrUkf2mCCizacqFYhVFiC9zyJ9QyIV4m7oabh
         BB6W/DuzufhJNKcMBViov/SD4uwvaASxiVwM4lfwWJPFsIs+npdvGuXoRg6i9gPSUfpJ
         Bc6tSCGFtDSPqlqLPoUySvKCbl3PSW48RPBlC4eAv+w5Z7n7eCyA5ICTgfwPvjwmJCSF
         D9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697486531; x=1698091331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQoDoAuWq/27hqVetrn03P+WXOf8CvsJiH0pcWvLvo8=;
        b=UkskaoKYXpnnwV/QOMfzyQWVk1WB4zTpfz6D9Ifwv/FKpqVNP+7PbmSRAhw6mm/QQk
         0UO1XZZS5wDDsym9IxD5EKxcENqkkhYAklkg/5Rpc3Y8bPkSyTEr9Auuq/9horWrz69f
         h7/aNdu3hGS0OuZP/HLniu9PoxCvCBnR5Rr6HfhOpLtb1QswI3oz9bqLQwetPQNJqBA+
         frHCApghvNfcs4PHJEKePaZbj36hP2AhRpdtsicm/VxEZBiYPLd5eXBr7RWR+Efl+Ydm
         Hr7nlwrOaHt1e5gZn768OJRCn84pq4LPDBkUyZHpJTlurTKiP+HRxC0IrrlfJKh80aE/
         pilQ==
X-Gm-Message-State: AOJu0YxsHvxDLj9ly2Ihd1VFmdhToi40GZ+SJz/nYjVuclsOMJUbObRf
        2qH0rMa5sYElRYSLeMJtahW5crE45JNNGzBzJ2uQGaXjYpJPTmHh
X-Google-Smtp-Source: AGHT+IEiZduk26BAV+LXO6Sp1CbtZai4FsTm82WcON+rlnsVc6WzvffJJYB6OxlWJBGqqTvVqSNBczi1dAwuuWKw6s0=
X-Received: by 2002:a05:690c:d8f:b0:59b:fb69:1639 with SMTP id
 da15-20020a05690c0d8f00b0059bfb691639mr271164ywb.32.1697486530827; Mon, 16
 Oct 2023 13:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <ZS0_BUDLXtFRT29X@black.fi.intel.com>
In-Reply-To: <ZS0_BUDLXtFRT29X@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Oct 2023 22:01:59 +0200
Message-ID: <CACRpkdbOZ+y6PAFp3DZMmAU3ri7=sPH0F+Wu8CPHdBcT3mNUoQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.7-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 16, 2023 at 3:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Medium sized update for Intel pin control drivers. Was at least a week
> in the Linux Next without any reported problems, please pull for v6.7-rc1=
.

Pulled in, thanks!

Excellent work as usual.

Yours,
Linus Walleij
