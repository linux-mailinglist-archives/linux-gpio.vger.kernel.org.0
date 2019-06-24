Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 690DD5010C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 07:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbfFXFkk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 01:40:40 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:59669 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfFXFkk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 01:40:40 -0400
Received: from orion.localdomain ([77.4.138.202]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N1x6X-1ihOs022f3-012JY6; Mon, 24 Jun 2019 07:40:37 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     kernel@pengutronix.de, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        t.scherer@eckelmann.de
Subject: siox: driver init boilerplate reduction v3
Date:   Mon, 24 Jun 2019 07:40:32 +0200
Message-Id: <1561354834-22617-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:wTtturKseSw62Mg1u4FlttGfZPKgGLNLe1vqf4zBZyiRy88271B
 YyUKXb1XSz+9PZIGQ9VBt3JiT6Nx01x+BViXcQyPl1PaBPUQsEvvlnyNhNkzm3FNDiYUxjK
 Wp48JmaR0EvOeIgj0E62lFss/DmS/GPYBt2tVidL8j+Ph+dLNErFZ1lAOvts0SNzEa7AIH6
 ksRU0U7SP0QP4emdDDJkA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:chhH1N20ZLU=:tx5YoGtq3T3XWTFel3HS4e
 /EiI8YD5HdOJ0/y3Dv8q8iQ2t5JOmO7CYa7Ep/EMkbsB8mQictOOvy5DQVh0GHrg4WxU35u6E
 Qg8R9MZZNxNM3vtD247N3PuqG/X7uATT2Bk6muNzfCOprT/PZMNqefm/xOoUZG6cRbRZei7dP
 W/Yj4B3qqScWHaIqEArFBug+6X/5RCcutDSM857AraDAl2ipWPzbvpvdtBnjDZxE07g1JVAAj
 rHS8Vja83vOgyvu/Im6Yb/jff/bj0JQu8SVWwCTizDweXz9c1VK2Qn7x+/ImWwSgVBTP8vP8D
 wTFol2zcsV9s8GMvta06Es+m+PPK+E8kotjVjGDzV6y9B23uzE/rtbGtc18yQFTg3UwzUGuLg
 fYlP0Lj3v7w+geCcbFJvVw6Q64RU7jAD8dUdjIuTmTnNMFlEgdiuPrj6JbCPc4oK5/hUf+UdR
 FMHc7rLQ58lp0+56LWq1oYpjzm6oMDICxVYwFvC05nCbcBWDQ5YCCrAhEOWtL/9dV01WPLAcq
 ASyyvPE3mvfp3wrMXtzXkOC4ABZYQdmeVZ/yGaoIqWapZABmxePQgIQR+P160u5TUXrDDt0Kv
 3qYUqY3T8eXXNGWosS95uay25OtPI2W5y3eHnjBA376QjHtwPeBIbigFzaRXV7qqlSiCjAggH
 5gHyg4LEvavBBgUYD8SUNK16CoIvCncfeU+l3HXSDFAl8Elai5T26FqhLV4D+esaJGXQL2+lr
 yBpfFaDMu5NdEvbIpHuzSVeXRzwqc9Foyu7rww==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi folks,


this is v3 of my siox/gpio series from last week.

v3: fixed subject and formatting pointed out by Uwe,
    second patch (gpio-siox.c) already acked by him

v2: fixed the typos pointed out by Uwe.


--mtx
