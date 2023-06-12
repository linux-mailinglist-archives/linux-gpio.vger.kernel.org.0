Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8681772B54A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 04:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233115AbjFLCDt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Jun 2023 22:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjFLCDs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Jun 2023 22:03:48 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F909B
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 19:03:48 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-53202149ae2so1940596a12.3
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 19:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686535427; x=1689127427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pnQANP68CfgvIajbRl7Qwq+a8MCRykgjf+90RPI5GFs=;
        b=TULDZByHN8GnaTRqAkI9Hn2wQFbN48PxGD1pFrd0XdWKomeW/li/T0BxFhHPNUr8Ef
         rLr5vS+INIBArpIgWS1daNj2GahPzgx+NuGHXrKL+qUL1XuAhuA6YL5Q0oChKWAz8++b
         Fumpd1G4ieW6MXUuyA1nHG1kRTzv++Affj4pFqGnpcE/P024A6XxIAlcjEqVocZ7rpZ4
         0LcMJvzs+tdS5WpA/7S4kicPHjYNX6xKif2MuV0zgmgf0Jsy+C5zKo0WSSwDyAUN/xmj
         79v856X5GBZJFfwnMGXokQ3JVcm5UpP+VpQ1G3R1Tsgt8ZuVkRaUzqaMqGmmCuB+7D77
         5Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686535427; x=1689127427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnQANP68CfgvIajbRl7Qwq+a8MCRykgjf+90RPI5GFs=;
        b=VnFgZMwNON3oWD6adziaYjK4PlqdftTH6G+7edJ+bRnqk9w29jPgNz9EXB9e0ODkmp
         E9HE+qHoPbyALhpiq9XckCD+0zthwU+D2lYzL3fRKrryc/KHSXTmux28LeRjCLdaWxF6
         GtxBgG4uIeeMkuPnR9wQv4oh0JElZAC8tihr8RH2XwTL4uB1ljZDzeUA0xxhDAqny1zF
         y/ueZFPh52JUVpPZWdRmZuM9/gfOuGaeZmz7cqBDhXcCr7Yx4dN4t46ELFOOnohw/idD
         1MACYDl3I0meoJ3b6kiHl8D44Kxb96hQZxhESqaIh5UiKaUKN9SgI7pwY7+CKzjh93RL
         SeSQ==
X-Gm-Message-State: AC+VfDyQl1xiOILsumu4Ot2/M3a1T1OF5JW6oAwf/HQ9zdFuxqi9Wz11
        RsKlbD3zuzdZ+X02tzDFw4w=
X-Google-Smtp-Source: ACHHUZ6XV1NTkotzzu5UBVHlEaU1DoxBNM7piumxIg6UNKQ9s3gy2dNl3LyS17aw74JhbySbL0yTqA==
X-Received: by 2002:a05:6a20:1586:b0:110:b0ab:8798 with SMTP id h6-20020a056a20158600b00110b0ab8798mr10037579pzj.36.1686535427538;
        Sun, 11 Jun 2023 19:03:47 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id a10-20020aa780ca000000b00642ea56f06dsm5860450pfn.26.2023.06.11.19.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 19:03:47 -0700 (PDT)
Date:   Mon, 12 Jun 2023 10:03:41 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Gabriel Matni <gabriel.matni@gmail.com>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl, gabriel.matni@exfo.com
Subject: Re: [libgpiod][PATCH V4 1/1] tools: gpiomon/gpionotify: add
 idle-timeout option
Message-ID: <ZIZ8/eo7eHDoYAx7@sol>
References: <20230612013049.10708-1-gabriel.matni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612013049.10708-1-gabriel.matni@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 11, 2023 at 09:30:49PM -0400, Gabriel Matni wrote:
> From: Gabriel Matni <gabriel.matni@exfo.com>
> 
> Add an idle timeout option to gpiomon and gpionotify to exit gracefully 
> when no event has been detected for a given period.
> 
> Signed-off-by: Gabriel Matni <gabriel.matni@exfo.com>

That works for me.  Will post some tests that cover this shortly.

Reviewed-by: Kent Gibson <warthog618@gmail.com>
Tested-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
