Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360B86455DE
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 09:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbiLGI6p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 03:58:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiLGI6U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 03:58:20 -0500
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DBA5DB
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 00:58:18 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id c26so5800380uak.5
        for <linux-gpio@vger.kernel.org>; Wed, 07 Dec 2022 00:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KrUbOsSIwyyFnVogm0GWqRytwqOtSd+v/Ikd7cyHZyI=;
        b=1S711F32y1jXfHou+S2ehGE7RwXhG3hLjdcKAP/3Vct9dk24NQlTdnjg4cbDvfX4Ah
         haial/dV2RN4IHESsCOCEzy9cQ2AqsD3B0m8ohn+/0fhvNEuKBl+IKxcMvWEQanqQ6FF
         b593Je+PKVgEirOr4RSTcYyhv2SGOA+WyV2BXxGIXsj0vqU0wt/ohtiLNQN1aCAzTL6v
         Cbffq5XnSHzG6okX7DgAXA0xbY/3B4IM83pkgjTrBvkkQIlvI1CWW/YmjilK0+A7/vk5
         PaG7Qtp9Iib3IwQ9Usx+dLLe32pQCZ/eCLvkH4E1XN1n1mrbQOiKXb5ND7IQPoJa68ZC
         oScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrUbOsSIwyyFnVogm0GWqRytwqOtSd+v/Ikd7cyHZyI=;
        b=UbOc0vp8+F8cIVADsfXZzaChT9WqzAhv+hdmt3PIbAheDtlnjF3RiNWIHnj/++IRAd
         0UttrW3exM/abgAcJGurdwBMKWnNGrCKroBSwrrOKAqFcyY2IW46/lHNqOleJb/5OQQ1
         ThPDcVWcWcc79gkyoApOiOVKicWeT2vhF5xaHjU6rbT8tc77kMeEumdVsYEgLKrYV5iQ
         jI1xYZD4S4SNGJ3xGSkQypr2yBXUKg7Izi+30+lYJ3AkcFEcHmcMB9S1ZvNFLl/9PRRi
         XRw8znevz3wH8qw1fjFBq3huSyiuJdIeIpIZBZJd3jTLBhrBi3omHp8vF0YUZpO2MxxM
         HBxw==
X-Gm-Message-State: ANoB5pn6pmHBJFUX+HoXgumzPPYvHtRx6IznHO8B1yhO6OuarpVp5Tc1
        x2/xDEA/+vqeXX0QaOtSliHJZ4hTfqM79F+oX5fYvA==
X-Google-Smtp-Source: AA0mqf6/4772zYS5aJ0XXujjvnq9X/VMtsISIdcMSRRGotzaQxgUDovPmtg0HbbfJgw5SVj3ECaMdSLFGcdZup/Vrns=
X-Received: by 2002:ab0:734e:0:b0:419:18c7:58d with SMTP id
 k14-20020ab0734e000000b0041918c7058dmr26473500uap.119.1670403497598; Wed, 07
 Dec 2022 00:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20221130124231.1054001-1-brgl@bgdev.pl>
In-Reply-To: <20221130124231.1054001-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 7 Dec 2022 09:58:06 +0100
Message-ID: <CAMRc=McvsBCvckkrJhV6dXyupvXZtsa25bQGAvOrqjLL5CC-bQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 00/11] treewide: an assortment of tweaks and improvements
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 30, 2022 at 1:42 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This series contains various changes for libgpiod v2. There's no main theme
> to it really, just fixing problems I noticed and introducing some more
> changes to the API.
>

It's been a week, there are no objections so I applied the series.

Bart
