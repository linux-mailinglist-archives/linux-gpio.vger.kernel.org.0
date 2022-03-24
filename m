Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7E34E63B3
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Mar 2022 13:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350234AbiCXM5U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Mar 2022 08:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbiCXM5T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Mar 2022 08:57:19 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA6E9694AF
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 05:55:47 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id t1so5516952edc.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 05:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=VnZAL0nBQUXclvhfgZG2Q/nAtL18/vmGeJE/PdQ+6So=;
        b=RW8hlbOrRKpR3xA6qZFsdX12/CElV/In451eCxUSkGc1VThpkDvgpST7aZhMC3z82g
         I7FoII47F1MWgM7kBr4BB9ZgByUabSwuPXuZ2GSD5P8dSwaYtkw28C9nUeV3rt1BkMCd
         IPokXqVmhv7CdthCYRLqIaahYW1LpOIKOorLN6Urg42l7ilzICs+Gf1gN57ZqN/Y7ur7
         l7hB3tCLzaB5zHPemfgHUTQOU9zWPeBAVaRCcyjOtv5Tev7OK9tDRZMWRCnU3a1FkdAf
         Lgv7v6oklCZ9q8SwZu72+0HDHZ6qNzQMJLyYllN9Zb/zjYST+SppDHRFsGzRGVy3n13c
         JaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=VnZAL0nBQUXclvhfgZG2Q/nAtL18/vmGeJE/PdQ+6So=;
        b=icK9LXPwKkeGAyR3sTLhdxOxy6uOQoUMkzWnvbEgzFW+ONrVRkngR1o9J8g5q+xWf8
         e19uk7iSH8i3YTD8/KWADkqP7E9tny9U1NgLIruzHk1Tp31HHUM7CrscfGGxnSxpUa4X
         hcpydc16iS/YenbwK7j5Z6ltbZ9b95MiAJmbBLJNUBKP4PniJvHBUttAJCQ+9hD50rmL
         GuLcJPOpJEWdiF0kZwXeuQbzuIedWP1v72YXIqjcPhTNprNSlgqvVyRnyIQy/P87xUw4
         3vN3xvW3rdRiiLQ8R8Aqjj1lZrQXWlBpWJbhkVPV5a06uRfugXJHynOg6s6KFNzHd7lN
         4dDQ==
X-Gm-Message-State: AOAM532D8CMwbHDNsceqAR+mqpagzKaOsUhItcqQlzjwHqZapaS+gnKx
        jEMPjPoGqPDMfCMA4gkBaO8=
X-Google-Smtp-Source: ABdhPJzrXLOnU2dOL2qzC5iVXryA+9B8ZnJgvUKH56+lmq3f7JFD9fBiYRpP3Wl64CGzN83NL8l5Xg==
X-Received: by 2002:a05:6402:1909:b0:418:d876:3119 with SMTP id e9-20020a056402190900b00418d8763119mr6655412edz.266.1648126546343;
        Thu, 24 Mar 2022 05:55:46 -0700 (PDT)
Received: from [172.20.10.7] ([197.210.47.244])
        by smtp.gmail.com with ESMTPSA id gn33-20020a1709070d2100b006dfcce8be86sm1122892ejc.225.2022.03.24.05.55.28
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2022 05:55:45 -0700 (PDT)
Message-ID: <623c6a51.1c69fb81.a07e5.4e96@mx.google.com>
From:   Maria Elisabeth Schaeffler <zahrauhalliru2018@gmail.com>
X-Google-Original-From: Maria Elisabeth Schaeffler <info@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Ich bin Frau Maria Elisabeth Schaeffler
To:     Recipients <info@gmail.com>
Date:   Thu, 24 Mar 2022 13:55:12 +0100
Reply-To: mariaelisabethschaeffler51@gmail.com
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Wirtschaftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, die restlichen 25% dieses Ja=
hr 2022 an Einzelpersonen zu verschenken. Ich habe mich entschieden, 1.500.=
000,00 Euro an Sie zu spenden. Wenn Sie an meiner Spende interessiert sind,=
 kontaktieren Sie mich f=FCr weitere Informationen.

Unter folgendem Link k=F6nnen Sie auch mehr =FCber mich erfahren

https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Gr=FC=DFe
Gesch=E4ftsf=FChrer Wipro Limited
E-Mail: mariaelisabethschaeffler51@gmail.com
