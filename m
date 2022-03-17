Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2091B4DCB25
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Mar 2022 17:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235207AbiCQQX5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Mar 2022 12:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233264AbiCQQX4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Mar 2022 12:23:56 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A77A215912
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2022 09:22:40 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id z92so6254752ede.13
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2022 09:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FekOFTLwxl+YM+FpHTen/YMFfSsadxn+Rgt8WDIgoSY=;
        b=ajkSppKhDnBxVYGUvYT29xKfYo44xj4NUU9SOi7JjHTBXiD4WDzGzPs9dcuHpW70Eu
         xquWbmkx+iO+3MvPhqdCKdydyO9CSXhL3wvR+5aInvUkiwcp6wDtpabIAOCoLWc7x95P
         XOJ79kgtOz85e/8s3fsTjZ0gKme6rzUYSFTrpB9pMStU/jFyFfLzvY/FLmbvCaGAHEI6
         iXrMUqy2jfkhjCtI0X9sToTjEtoh9I9snZO26qa6DdM6jSZdEtfsk6fQ0V1VryJEfmks
         IhXHiYNmqUmqZSrMwPNYNowu6VExZmNquHtZv3nd7o7mczSvbu4L6uOFzCiZe9EFqSOv
         rj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FekOFTLwxl+YM+FpHTen/YMFfSsadxn+Rgt8WDIgoSY=;
        b=yANIpZNBlVMaDoRWFw3RIpY3EVyfFBVXik/0QeKjYD2bbDBBiEC1l0Rdnz158pTYuX
         RGhO1RoFUzp42j0TvYAJiQnmuo94m4p49cnEW+lNe3jHnTQXua4JUt0F/T/iSQ1Png/r
         17uFHgfWVP/1KMW3ihYEQ/srFv/W9Za0WTxbWmVq+quvvbUsktFWO1aICDNWHt9n+YBq
         8PAVdTDYiHKGHgJyRytRSTHfJbg/5cX0iXGl6g1CTBHzyp2Ck0P5DV+ujWO66ExiI+UY
         b6Pi1gWZKIR3dyYqxvcfdCcxwICNvmgBaxxzdCphNw4Xet19VtVfr22TuOGm5dwuTAy+
         hQwg==
X-Gm-Message-State: AOAM531Kxd411SYIO33wW9d4W91w8Dkvx0ughAjd2wGv0ukW9Uz+BaYc
        ShdbLJdItaLXh7g15y7b849XZEAX//ODPtCRPFO49p+aiBgnBhgb
X-Google-Smtp-Source: ABdhPJwWaPGE4s81NI05TdyNH5e/+1qYwnwd/PTYBfaGdgeKbWQ+JhQobpVuG7tpboc5T7jfAP3DHVwlYBHlU9EGfQk=
X-Received: by 2002:a50:c00f:0:b0:418:d6b8:7f9a with SMTP id
 r15-20020a50c00f000000b00418d6b87f9amr5422176edb.141.1647534158597; Thu, 17
 Mar 2022 09:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220316020441.30001-1-warthog618@gmail.com> <20220316020441.30001-3-warthog618@gmail.com>
In-Reply-To: <20220316020441.30001-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 17 Mar 2022 17:22:27 +0100
Message-ID: <CAMRc=MdbVEiDGUtm4KO4Ovan=J8DAFmWE1_cFdEO_MHe48hqZw@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 2/3] core: use num_values rather than
 num_lines when dealing with subsets of values
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 16, 2022 at 3:05 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> To be consistent with other usage, when getting or setting a subset of
> requested line values, the array sizes should be named after the values
> being accessed, not "lines" as that could be confused with the number of
> lines in the request, not the subset.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

Applied, thanks!

Bart
