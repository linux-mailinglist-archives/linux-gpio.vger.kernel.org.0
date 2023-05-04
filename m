Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7586D6F6D41
	for <lists+linux-gpio@lfdr.de>; Thu,  4 May 2023 15:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbjEDNs6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 May 2023 09:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbjEDNs5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 May 2023 09:48:57 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3DC6E95
        for <linux-gpio@vger.kernel.org>; Thu,  4 May 2023 06:48:39 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-63b67a26069so694834b3a.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 May 2023 06:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683208119; x=1685800119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VWiVpXg6onZ4j8QAlHmA1Tak0LmnzNAzhBc/cH8UVXk=;
        b=YbShpVe2+b2+MrU9vsPoRqhVqDpOEGlxodGoaeGLVqKZ/NM1tI1lmiIbPVVknw7Qof
         D1GLM1JxvAoDzYTORsGmKLM8N7oug3Sgm1Q9RqRhH2avsbQysCy3JU3L85/mcC9QwTd3
         H1yss7s+CVenoOVK3RX0tsWWtpe/xfz47LGXrguhHK2Jr7XTMSd9Ge2nYYZrOYgMKzZx
         YFniTiAdZDfEoa3CM0GQI9wVqIMSSGiG8CmE63u31Q152DTX/izK/US7HVOWG+2YumJa
         KHgw1i8R2I6KezGR4lwRJJcEz3O4GBnmAd9E1aQlkismh5AozQyg6XCCrpedA7UmjlIp
         6/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683208119; x=1685800119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWiVpXg6onZ4j8QAlHmA1Tak0LmnzNAzhBc/cH8UVXk=;
        b=RSa1a0hAXiX/SxJrGjG8rh4hXRmo3MKIlw9wiwYfAHEYwVFMICELP946bfIBXg9T0l
         fKM8QAaEPeQn07Gh3pkk9v7lMsrg7p0xUuEBZOfreylw9MKbohS3LOk7MBqDz2TNsJeh
         ZlNt0v4J+Ojl0lomZKA2VitA+CqKAbAjFGq60vuk7r3qpWz3vGdIJiN6cQiyhkdjrxP1
         h0sJtF++2tac9T5WPz1Vub9dxnfyNHbCXlAOelk75hLfcOdel949T/rd9R55BopMorUL
         yco6Q0ZsMPtefkJl6ciwzrmsqKmj/cRAc3nTaT3LCy+VjQTl1VkXrKWnurcjFL9v/zSy
         UXBQ==
X-Gm-Message-State: AC+VfDw722CfSDGHduKPyPl3QkDu3OVq+gN2mS5XIg69hS+y/YFU52cx
        dcdRzIPQJwb7HgWxA9HhGlBVvTLu6lA=
X-Google-Smtp-Source: ACHHUZ6J2xP+kDsO/fVEQgAovn6JCjl5a9gLFAuj3zGh5O5MdHSc60fNmYwpIu4FsBhU+T3X1oSsmg==
X-Received: by 2002:a17:902:c085:b0:1a6:b971:faf8 with SMTP id j5-20020a170902c08500b001a6b971faf8mr3368173pld.53.1683208118810;
        Thu, 04 May 2023 06:48:38 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id w17-20020a1709027b9100b001a980a23804sm17778402pll.4.2023.05.04.06.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 06:48:38 -0700 (PDT)
Date:   Thu, 4 May 2023 21:48:33 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Milo Spadacini <milo.spadacini@comelit.it>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] tools: gpio: fix debounce_period_us output of lsgpio
Message-ID: <ZFO3sXP3SXiCzI+c@sol>
References: <20230504092217.484339-1-milo.spadacini@comelit.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504092217.484339-1-milo.spadacini@comelit.it>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 04, 2023 at 11:22:17AM +0200, Milo Spadacini wrote:
> Fix wrong output that could occurs when more attributes are used and

      incorrect output        occur


>  GPIO_V2_LINE_ATTR_ID_DEBOUNCE is not the first one.

Have you actually seen this fault occur anywhere?  I would expect not,
as the debounce_period is the ONLY attr that is returned in practice by
existing kernels. The flags and values attributes are never returned in
the attrs of the gpio_v2_line_info - the flags are returned in their own
field, as they are always present, and the values are not returned in
the info at all.  Those types may be used in the request for multple
lines, but are not returned in the attrs for a single line.

> ---
>  tools/gpio/lsgpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
> index c61d061247e1..52a0be45410c 100644
> --- a/tools/gpio/lsgpio.c
> +++ b/tools/gpio/lsgpio.c
> @@ -94,7 +94,7 @@ static void print_attributes(struct gpio_v2_line_info *info)
>         for (i = 0; i < info->num_attrs; i++) {
>                 if (info->attrs[i].id == GPIO_V2_LINE_ATTR_ID_DEBOUNCE)
>                         fprintf(stdout, ", debounce_period=%dusec",
> -                               info->attrs[0].debounce_period_us);
> +                               info->attrs[i].debounce_period_us);
>         }
>  }
> 

The fix itself is ok for debounce, so no issue with that.

But if there are multiple attributes, as you suggest in your comment,
then how about printing the rest of them rather than omitting them?
So perhaps replace this with an exhaustive decoder for all possible
attributes - probably implemented as a switch on the id and include a
"what the??" for the default case?
The flags and values types could be covered by the default, given we
don't expect them, but if so then add a comment to that effect.

Cheers,
Kent.
