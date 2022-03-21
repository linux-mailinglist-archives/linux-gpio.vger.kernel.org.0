Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76FBE4E2492
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Mar 2022 11:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346452AbiCUKpT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Mar 2022 06:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346499AbiCUKpR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Mar 2022 06:45:17 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3EEDFE8
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 03:43:45 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id b19so20038846wrh.11
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 03:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=wxNVRqoAU1nLSbi4GV1YP5CiZq5nfUAUVPkinobO1So=;
        b=f4jrXR19mcK0PdWHNI9zkFLYHhVI5Nb5ddCMANFRk3X5aBu4DpzwD3Qf5Djnefv89n
         +zRvNtk3wcFinuPjjeZK5c78ZA5O4kHO2Qy0KqoNAltYlzQms87dA4Vf5ku99TWCHvtW
         SyrdPk1ilCsxi/3WNiA29YcNaqFoKToSMLgvpT6ssT8M3utpkjYsNKj9GQA7N5aeeXpV
         R3GeAPu8JwgNK9vfyXk+25bvDKNfRxMcTlmoow1PB3dNDOZnRdgcYq6dAbA785PFx2Al
         LCp+kJqHQfpj1gAA+JsOeQkrAbOE6u0PeyEw5mbSHEC+V+C3XNYUFOb6j9pB4+/4Xwn5
         ffjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=wxNVRqoAU1nLSbi4GV1YP5CiZq5nfUAUVPkinobO1So=;
        b=zWSbar+Y1PRzrn5szAX51BGHq8Cbp47h28bQeMiG6SsJnv+bViVgPrEJnM/9K3jfHZ
         VY+5NyuBz4VwMvaZAB05toQxA2rLvKy8n1lx5nOTn0uIsHrNhdapPeE7RBuIHUhC1GDT
         EPzqkEZyEWxPzrU3LuA1QgFv2A3/GkLVxC/8Z5CEcK1dejxWr3nW7y5zOiizML2lJeg6
         L27/9xFX83Za5J6g3ACJ2YAGYlR3OXfal7YQv2x8z0P0DmxCNj+TNptvZcJVf3GKnLnT
         bYK8Qz3F0MruecfHOSZgYjLOWu6AHfpXhOdEJtG4ZQifmkhsXXSa0in/WwPKPQ/FZUFQ
         Fw9Q==
X-Gm-Message-State: AOAM532Q2BSvXCNpJZVlytLl3sIs/Gj2jWLM0ZJ7zZWSnNyvrZgl/EI8
        94hgr3bB9/uxlVtD2dP/qMmxTaQA25dhtg==
X-Google-Smtp-Source: ABdhPJzB/W/QkEN/CZol2WapAWX5dOZIuNNfWvvUpYWrDfmJygMbFwg0sXmyyLVwnqSwzGSyrx9TwQ==
X-Received: by 2002:a5d:64e3:0:b0:204:1a79:f1b9 with SMTP id g3-20020a5d64e3000000b002041a79f1b9mr1551304wri.330.1647859423713;
        Mon, 21 Mar 2022 03:43:43 -0700 (PDT)
Received: from [192.168.1.31] ([90.61.176.186])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d59a8000000b00204178688d3sm1709858wrr.100.2022.03.21.03.43.43
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 03:43:43 -0700 (PDT)
Message-ID: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
Date:   Mon, 21 Mar 2022 11:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: fr
To:     linux-gpio@vger.kernel.org
From:   Hans Kurscheidt <lve0200@gmail.com>
Subject: gpiod: Set pullup for Input Line
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Despite deep searching, I cannot find any information, if gpiod allow 
specifying pull-ups to input lines and how to do/handle it.

RGDS

hk


