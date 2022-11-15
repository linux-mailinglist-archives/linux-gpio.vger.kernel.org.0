Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1568E62AD8B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 23:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbiKOWDN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 17:03:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232418AbiKOWCw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 17:02:52 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BDFD2FC2C
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 14:02:51 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id v17so23911853edc.8
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 14:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GcIrTj8VztBeFoy4k6qhtUBsqi2dQ47UyYJpB5EaTPo=;
        b=nftL9VuGbqz2wS8aoSGn3u7lKhkqTIh6Qw3ut+/2+mk6iuDylkuO4fKqsTWNWzmabb
         1+uO4j7fYObWyKAiKEKmBE6gzehSG2tyufgvwVYrmRAYLhOssRGJ9oA3QBbh9RyOLzlD
         D5fcH2cI5+DXyeI+BcwcFUebEsI1vJt1W0bEQaW9X71inPhHZi6DXA+kWLv8R2nH9LVA
         yCJcUwuUooshd1gvooIvbPMh2/lQOVvj9ve3fZmdH63tyY2mitEUq1BLVqJRK6kOV6ox
         eeo5WJFrUM+yQ2HFSuYk0Ulo2z+7GNylpGJhI/w5XIqx8FYdEGgPziqKHptGoWU+3dLY
         VcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcIrTj8VztBeFoy4k6qhtUBsqi2dQ47UyYJpB5EaTPo=;
        b=5XYG9Tj00e9dH0sZNHUdEZ515HJFjANsuFBRWP+WyH28YrNxLL2At7ZzN7VoZk8Y3J
         vSFQ4J0KZT77WwH08O4WIxADEiidOZiAYoX3j/Cf9HQ0B76zdOVyqkoLGC2iUerOAF8E
         +o+XUUskePaSvt07JkT+S3J3A0vlIqeEOqPisGIJpUjsg3D8KGl3bIlM7YTf96VkP8m4
         eOgeVItHQBC4ixAYRy/dHJ0Yi19B2GUyU1aCvRNnL8EHejABh/UJyJHeidAK1nsw+s7j
         BpWKQ/blNb+cs5uG3gDVf1SLnNCrwKjsgNS/A3KF9XFur9lUJPR+vtFaEMiQg04NkO/d
         jVLQ==
X-Gm-Message-State: ANoB5plxzo297vMjpSMz57w/bhg54LRUJF2qhxqGplaFpnmHgg7m2JKq
        bGkQypOwoBS1zuhUKwcC2CgjBkg/4fr2tcGerSAcTg==
X-Google-Smtp-Source: AA0mqf5SXfBI6T37ANtaU6IquIxC4j46qTnsreujvs83VOL05kbVxIsQj9U6F2D9Uv3/ulToJeZmoQ1bjTwySKzYq/0=
X-Received: by 2002:a50:fd8f:0:b0:461:46c7:310b with SMTP id
 o15-20020a50fd8f000000b0046146c7310bmr17315493edt.307.1668549769960; Tue, 15
 Nov 2022 14:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20221114202943.2389489-1-bmasney@redhat.com> <7420da17-d6d6-10e6-c87e-d3dc37d17ffb@linaro.org>
In-Reply-To: <7420da17-d6d6-10e6-c87e-d3dc37d17ffb@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Date:   Tue, 15 Nov 2022 16:02:38 -0600
Message-ID: <CAKXuJqgckbmikXwFi0g3P3Db5jvyst+xhQBcPoV7mA2XStVVzA@mail.gmail.com>
Subject: Re: [PATCH RFC] gpiolib: ensure that fwnode is properly set
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     Brian Masney <bmasney@redhat.com>, linus.walleij@linaro.org,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        psodagud@quicinc.com, quic_shazhuss@quicinc.com,
        quic_ppareek@quicinc.com, ahalaney@redhat.com, echanude@redhat.com,
        nicolas.dechesne@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Others in the thread pointed to Thierry's patch, but on the Lenovo
Thinkpad X13s, that patch did *not* fix the issue, and with it
applied, the X13s still immediately reboots as soon as exiting EFI
services.  With this patch applied, the X13s does *not* reboot after
exiting EFI services, so thank you for this patch.

Tested-by: Steev Klimaszewski <steev@kali.org> #Lenovo Thinkpad X13s
