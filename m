Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9FD96020
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 15:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729842AbfHTNdV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 09:33:21 -0400
Received: from mx-rz-2.rrze.uni-erlangen.de ([131.188.11.21]:60217 "EHLO
        mx-rz-2.rrze.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728993AbfHTNdV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Aug 2019 09:33:21 -0400
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mx-rz-2.rrze.uni-erlangen.de (Postfix) with ESMTPS id 46CWn06MnBzPk8g;
        Tue, 20 Aug 2019 15:27:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2013;
        t=1566307652; bh=RRTtHjXBxTVQh7do1YcOe264VD6+MXJr+xqV5RKHI8I=;
        h=From:Subject:To:Cc:Date:From:To:CC:Subject;
        b=FRauvwOoLCS8bzBBigiDmnT9hEaHmyVg48UQbuZEYaTymk3hq9n1MdM5qhHOwK2PO
         h023wKb9xzOLkNNR9r+2oUN+LWlLFW870hYJz8uHLQ7h44U6z6Tc46cgQCaHCfJ6CR
         7K2U4bjI9FW4dMBkvDkas/8XpkUe5a154hxfOzOfcl/spBVGgU9FCSSSySR3fESvFH
         Dx6Pv/u6yss37sENF3xdxrHthXf2Le5W/2WFtsewRW0zlRSy2GJxQUnUoRJoUwfF69
         6K9VGNjxIFERUsBoyKFmaBjCKXmWZQMxeeLBBz35pawD/Hkz+p2lbRTAOPT7JuWOLa
         5Z46RiK+ntEOg==
X-Virus-Scanned: amavisd-new at boeck4.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 109.41.192.99
Received: from [192.168.43.238] (ip-109-41-192-99.web.vodafone.de [109.41.192.99])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: U2FsdGVkX18k1zGhCfJiNFmXL4fjORVG2nesGGst0Vg=)
        by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 46CWmy1k4mzPjgS;
        Tue, 20 Aug 2019 15:27:30 +0200 (CEST)
From:   Sebastian Duda <sebastian.duda@fau.de>
Subject: Status of Subsystems - MICROCHIP SAMA5D2-COMPATIBLE PIOBU GPIO
To:     Andrei Stefanescu <andrei.stefanescu@microchip.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com
Message-ID: <d2bdb45a-3571-5989-8278-6f5c7d9839f2@fau.de>
Date:   Tue, 20 Aug 2019 15:27:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andrei,

in my master thesis, I'm using the association of subsystems to 
maintainers/reviewers and its status given in the MAINTAINERS file.
During the research I noticed that there are several subsystems without 
a status in the maintainers file. One of them is the subsystem 
`MICROCHIP SAMA5D2-COMPATIBLE PIOBU GPIO` where you're mentioned as 
maintainer.

Is it intended not to mention a status for your subsystems?
What is the current status of your subsystem?

Kind regards
Sebastian Duda
