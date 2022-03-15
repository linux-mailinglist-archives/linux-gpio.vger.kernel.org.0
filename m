Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBC04D9AEB
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 13:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240407AbiCOMP7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 08:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348169AbiCOMP5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 08:15:57 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60C04665A
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 05:14:45 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id e22so1201101edc.13
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 05:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o5h84Tp0kTIUC503g6/hslR/FMjOqxTCpM1IdyNyfbI=;
        b=oo31avLUvDcdcKKbHQ59RTTATc5R4beLQ5noDQezQifup5UXXuMYAZePy4nR1uuSq1
         q/+Tr8whqsxO+tVwZMQcKnrGIrvKPUmWOR+3GdUSUL5RXMmAbHfq3b18Bvg0LLZej1hJ
         dI+szIzA0zyiqzLpDcVAqy1G1cOjwM13QexIfMMZasPHC0Wo2LS5/ymrIKKhesiZKb6z
         uw65+DF/lyd3+80yunkBmUPbS6w+l8b8UYLTxxQleBhKeRdaD9Rd+SW8ZlD9gYBIMeLX
         HtTxzJGgEzzpxpEzNB/65B/OFfzzdQ1BCvGOInU3B99OUB9xCVx7CsZVyaqhwvegrTz4
         MtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o5h84Tp0kTIUC503g6/hslR/FMjOqxTCpM1IdyNyfbI=;
        b=CutwW0LummHV9iJ6X5fQH7Htd4lE9r9zlH7HabwwJMe7O1Wr75gT5kXgu17gVVZr+P
         yQOdeuMt2GArWXkQWxGXmARkDsunX9gGcHPsajAtWWhrKIXc3hvB0QRBgqIdRuBKX1gW
         yu76ymJbMBreV7b8xCZuCcan65FNkHkbosDxOKOpd5Ie8AisnN0SmFLiatD3JxcXpRye
         MAqilHSdZ9MOpIopQdR8OZiBuGqrbTGTMjtgTahJLu3kLOh8khtscpis4LtCk6C6kMuo
         YYV5IT3Nyt+fsBF2W4UBdN+9slMFRk6ytxZ1KIK+Y5qMisuu5FYDhPShf9+EgOkllZP2
         6pbA==
X-Gm-Message-State: AOAM533I4ebDGyGTtFxKpx1FyIzAieiaUk2L1VVynMyTP3/9u3Ek0Ygi
        ypiT3RtP4s8tyijgI2FO/wRH4df2BwyPI93txMpZWzSH1MMSTw==
X-Google-Smtp-Source: ABdhPJzCMSJxkhst+xOZ4XBYvmBwpMrYwODxZpCCtCN/lkXdsd7EKru5OEESvpkpGg9tnQWvvb6s6xhM2BmArgEk+Ps=
X-Received: by 2002:aa7:d706:0:b0:415:a00b:4ee with SMTP id
 t6-20020aa7d706000000b00415a00b04eemr24890006edq.373.1647346484545; Tue, 15
 Mar 2022 05:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220315053220.102934-1-warthog618@gmail.com> <20220315053220.102934-4-warthog618@gmail.com>
In-Reply-To: <20220315053220.102934-4-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Mar 2022 13:14:33 +0100
Message-ID: <CAMRc=McOh6FwkzttD9b+bFf5X7EF_wT0oyeCcnRwcUprw8w6nw@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 3/3] line-info: rename infobuf to uinfo
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

On Tue, Mar 15, 2022 at 6:33 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> The infobuf variable in gpiod_line_info_from_kernel() refers to the
> uAPI version of the info, and the "buf" suffix doesn't really
> emphasise that, so rename it to uinfo.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

I don't entirely disagree with infobuf not being the best name but
uinfo is even less so. The 'u' prefix doesn't mean anything on its
own. If anything I would think it has something to do with udev,
udisks, upower etc. Or "mili" like useconds. How about info_kernel?
kernel_info? uapi_info?

Bart
