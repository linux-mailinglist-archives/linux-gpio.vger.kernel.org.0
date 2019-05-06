Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09862153D0
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2019 20:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbfEFSqE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 May 2019 14:46:04 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:46775 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbfEFSqD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 May 2019 14:46:03 -0400
Received: by mail-lj1-f176.google.com with SMTP id h21so11965023ljk.13
        for <linux-gpio@vger.kernel.org>; Mon, 06 May 2019 11:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KTKnnbRWy6aWPbBF6uXyIYDuEHVk6sXErNkxiIQl7a8=;
        b=IIoszxVTRVBMRTmGHJ+cUCn7I6OWazK1BIyQ80jVSTK81UVv0G0NhxsLOjQY6+rAqr
         yKk8NHh9njbZWwui/dUZ44RRY7QPYSnYfZ9yQdYVTAJkEcIuCVgE6VCVeJBJeB1FZZ/Y
         2FpUI15YXm7J7JbioKpfrcepd28gwqaun59VyO8qO2A/QGzvriCMpYwa70kne4dHldQd
         SKDBWQa6MYvoWq1pYuRflQ0Bzwo7TWAeZifByOp1Lkoa4vyQIwfL2xyV52fq5Z8FsaL2
         ncPo+vi9gQA9ulmo9cfnXBUYligdLih4fVOxrCx2KQY8nmx9zEy2oESvzfVlJhEn6ssx
         Puew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=KTKnnbRWy6aWPbBF6uXyIYDuEHVk6sXErNkxiIQl7a8=;
        b=g2yLwKL9n0Qo1R4tOadfghwKuV04d67CaozpriXvVsoVrbbAAmswPA2bu6holL9IiS
         RJHN/qepBbIHzFw7PgHH/Fy+Vk+oXDhRDD8XgdKhXn4H8vQL/2b3GUpIYecdAC2CCI9S
         FQ16dMlC104/9QVgmLDIDkExT/uDu7XE62P/BL/poqAYUQnxeUzc888t2lc1QfBvei3q
         MvtYMJu/moyWB27B6s36TIil6Z0I/HOb9MHhx3HLjK/UVV/mOmZuEeTsmPglLQgdALI3
         pH9cnpN/b01b39ZK05LCy0oXlwDSy5MCH3y9q84oDVkLjsS0voEh7Q5NoNH9K34AP3i6
         dcmQ==
X-Gm-Message-State: APjAAAWTH2efARQkBXey06xeqoijPRNo4WSaiUmoy1u6imcqsypeWJep
        VolgWp5Iig0n4CGZRBJj034ucfRlfxo=
X-Google-Smtp-Source: APXvYqwNBjQ5A85/g3klXWww6qZehcNmuyAGnTsB3asGTw4PbpjwFPTxeTathJYv2YCLKV8t4fXTdQ==
X-Received: by 2002:a2e:3a0a:: with SMTP id h10mr12552045lja.1.1557168361740;
        Mon, 06 May 2019 11:46:01 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.80.83])
        by smtp.gmail.com with ESMTPSA id q17sm2561030lji.22.2019.05.06.11.46.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 11:46:00 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: Remove MMC_{CD,WP}
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20190503114304.20412-1-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <7b8155bd-94da-8bc5-ab64-3847dc30e9a0@cogentembedded.com>
Date:   Mon, 6 May 2019 21:45:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190503114304.20412-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello!

On 05/03/2019 02:43 PM, Geert Uytterhoeven wrote:

> Hardware Manual Errata for rev. 15.0 of March 26, 2019 removed the bit

   1.50 perhaps? :-)

> definitions for MMC_CD and MMC_WP in the documentation for the IPSR6

   ... and IPSR7. ;-)

> register, as these pin functionalities do not exist on R-Car V3M.
> 
> Remove the definitions, and the corrresponding pins and groups.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in sh-pfc-for-v5.3.

   With these small issues fixed:

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
