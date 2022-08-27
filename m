Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38C075A3382
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Aug 2022 03:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345120AbiH0Bhy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Aug 2022 21:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345100AbiH0Bhx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 21:37:53 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A53FE9A85
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 18:37:52 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 12so2882806pga.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 18:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=HqzUEj0LEBcBlPXHCCwIuOc4LAuOTz1cVAzefiU6oA0=;
        b=lT13bpUX0I1EqB2Yce8drmbnqHqoiWfhucPifv7xvJpQPDfDg9kO+ELo134APXzSe3
         V9iG6LKPSHU7scq/SetzWYICfr6ka8Z636jJKAryRYgJGNe7JzQ0GFpibxooofm1YPwB
         xz0LFAQAPtKs3FE+hQYfLts3O/pxZMGa7g3VDUXGmPB9m0Vl2NBdx5VFXSoRwrBKwvvX
         0rtnsb6S/3w2/hPRb+9cBNq6GV+flC0wGORpCoTuCCNAMsjHOqVmOauUo4WJqYKJlDEl
         YjiD41GiXdBI8Mv71rpuQJreVSp+pqMjYnhjlqK5LHk/eZXmyqA6hEI2/MzoQFB3/lbM
         I9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=HqzUEj0LEBcBlPXHCCwIuOc4LAuOTz1cVAzefiU6oA0=;
        b=xemApBFKB6Ypl2eAhrlSU8Niu359si1Q9yk0BnzS7XPa3mXe4B6U8jspKuorv1eW+2
         qCNq51ZjLvlTdSZfy/4Qs6R8QWwQ8XL0rE/V3o4YrM1lMFq7K6qWzRJgbdfYOLNPlOnt
         Y4u2BVGwe/sarQrHLTuUKns0XYgByGzQCcU9S78jNLcEWM6KZKscBK4oCJYsW3rl5BIB
         rwqaBfhBmDeNRUD/u1LWF2QwAiWWkiIgO4G3XXrRd1xfDkhMABeNjNEqhMUlkT6sVoEt
         qRPt9d9TXFgBgt3SxxhVhDOUcgRtdscUM6s3DsOe5aCzCaSE92yyW7PKBowgzhF0Lb1L
         TRrw==
X-Gm-Message-State: ACgBeo02Is4mMG6CagwGeUJLCnWtfFVN70zdbcPkHjapjRfzlhXUKKZU
        6A4x4F8OAWF6zAszlhgQ4T0=
X-Google-Smtp-Source: AA6agR6dsPmnET613AMlqjn0/LTBvphOj21TDLFcHyvSERgPhnXYi2HstmNYkd002dElQVyNrdRn7w==
X-Received: by 2002:a63:3204:0:b0:42b:40b9:bfc4 with SMTP id y4-20020a633204000000b0042b40b9bfc4mr5369736pgy.357.1661564271993;
        Fri, 26 Aug 2022 18:37:51 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id 145-20020a621597000000b005375a574846sm2405625pfv.125.2022.08.26.18.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 18:37:51 -0700 (PDT)
Date:   Sat, 27 Aug 2022 09:37:47 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Adam Tofilski <rotofils@cyf-kr.edu.pl>
Subject: Re: libgpiod - bufor problem
Message-ID: <Ywl1aw447YBhB9Oc@sol>
References: <001901d8b95d$359a2060$a0ce6120$@edu.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001901d8b95d$359a2060$a0ce6120$@edu.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 26, 2022 at 05:04:58PM +0200, Adam Tofilski wrote:
> Dear Bartosz
> First of all thank you for gpiomon software.
> 
> I try to use if for data acquisition from an optical sensor. It works fine
> from command line but when I try to run it as QProcess in QT (GUI) there is
> a problem with buffering. The output is transferred occasionally in large
> pieces. What I need is to get output immediately after each line. I plan to
> distribute my software as open source.
> 
> As I understand this problem can be solved by adding to your code 
> setbuf(stdout, NULL);
> or 
> fflush(stdout) 
> after each line.
> 

My proposed tool changes for libgpiod v2[1] include the fflush after
each line for the same reason.  I had issues with the setbuf approach,
though I don't recall the specifics, so went with the fflush.

Maybe do the same for v1?

Though I note that the target audience for that is cheap and cheerful
scripts, not apps.

Adam, the appropriate solution for you would be to use libgpiod directly
rather than wrapping gpiomon.  The tools like gpiomon are just that -
tools. The output of gpiomon is not part of the stable ABI, so
getting the events directly from libgpiod is the way to go.
Apps should use the C library directly, or the C++ or Python bindings
as appropriate.

Cheers,
Kent.

[1] https://lore.kernel.org/linux-gpio/20220708120626.89844-1-warthog618@gmail.com/

> I hope you will be able to help me with this.
> Best wishes
> Adam
> 
> Adam Tofilski
> Department of Zoology and Animal Welfare
> Agricultural University
> 29 Listopada 56
> 31-425 Krakow
> Poland
> rotofils@cyf-kr.edu.pl
> tel: +48 12 6625069
> 
> 
